---
title: "What the hell? Same-operand comparisons on Intel architecture"
permalink: /blog/same-operand-comparisons-on-intel-architecture/
layout: post
date: 2019-10-04 21:37
comments: true
categories: 
- Infosec
---
# 

I was reading _The Shellcoder's Handbook_ and, in chapter one, the author
discusses how being able to recognize C-like language constructs in assembly
code is an important skill.

There was one example which threw me for a loop and I just couldn't seem to
understand what was going on. This was despite all the reading that I could
including the references for the `or`, `cmp`, `jxx`, and even `test`
instructions.

So I started writing this blog post and, by the time I finished, I _think_ I
understand it now! I decided to publish it in case that it helps someone else
out _orrrr_ I got it all wrong and you can tell me :)

Okay, so, here's the C code that the book wanted me to recognize:

```c
int number;
if (number < 0)
{
// do something
}
```

The IA32 assembly that the book translated this to was:

```nasm
number dw 0
mv eax, number
or eax, eax
jge label
; code for 'no' condition
label:
; code for 'yes' condition'
```

And what I was _really_ stuck on were the two lines:

```nasm
or eax, eax
jge label
```

I knew that, following the `or` instruction, the value of `eax` was not going to
change. I also knew that this instruction was manipulating the `EFLAGS` register
and that the `jge` instruction was evaluating those flags. What I didn't
understand was _how_ this register was being manipulated nor evaluated.

I started by reading about the `or` instruction. According to a [logical inclusive OR reference page](https://www.felixcloutier.com/x86/or),
"the OF and CF flags are cleared; the SF, ZF, and PF flags are set according to
the result." But what did "according to the result" even mean?

I looked over the docs for [conditional jumps](https://www.felixcloutier.com/x86/jcc)
and the [`cmp` instruction](https://www.felixcloutier.com/x86/cmp). I knew alot
more than I did before reading these but it still didn't answer my question of how
the `or` flag manipulates these flags or how `jge` evaluates them.

In reading these references, however, I saw that the `cmp` instruction worked
by subtracting the operands and setting the affected flags while discarding the
result. I felt like I was getting closer but I still didn't know exactly _how_
these flags were evaluated.

_Finally_, I noticed on the `cmp` reference page that it referred to an
appendix to the Intel software developer's manual. This appendix was titled
_EFLAGS Condition Codes_. This sounded promising!

Googling it led me to a PDF of the chapter _[EFLAGS Cross-Reference and Condition Codes](https://www.cs.utexas.edu/~byoung/cs429/condition-codes.pdf)_
which finally cleared things up for me.

So, what the logical `or` comparison does is:

* Sets the zero flag (`ZF`) high if the result of the _subtraction_ operation is
  zero (i.e. the operands are the same) -- in our case, the operands are the
  same so we can ignore this flag
* Sets the parity flag (`PF`) high if there is an even number of bits sets -- we
  can ignore this too (to be honest, I don't know why this would be important. I
  guess that's a future blog post)
* Resets the overflow (`OF`) and carry (`CF`) flags so we can ignore these too
  in our case (sort of)
* Sets the sign flag (`SF`) high if the result of the comparison is negative (aka
  the most significant bit is high) is high

The other thing that reading about the EFLAGS cross-reference and condition
codes taught me was that the `jge` instruction was evaluating the expression
`(SF xOR OF) = 0`.

This finally made sense, I think! Based on `number`:

* the `SF` flag is set high (`1`) if `number` is negative or low (`0`) if
  `number` is positive
* the `OF` flag is always reset to zero

Given that, we can look at our code again and work through some examples:

Say we let `number = -10` here. We wind up with:

```nasm
mv eax, number  ; eax = -10
or eax, eax     ; eax = -10. SF=1, OF=0
jge label       ; (SF xOR OF) = 0? => (1 xOR 0) = 1 => jump!
```

Or let `number = 10` this time:

```nasm
mv eax, number  ; eax = 10
or eax, eax     ; eax = 10. SF=0, OF=0
jge label       ; (SF xOR OF) = 0? => (0 xOR 0) = 0 => don't jump
```

Finally, let's test our boundary, zero:

```nasm
mv eax, number  ; eax = 0
or eax, eax     ; eax = 0. SF=0, OF=0
jge label       ; (SF xOR OF) = 0? => (0 xOR 0) = 0 => don't jump
```

Does this make enough sense? Is it even correct? If not, please let me know!