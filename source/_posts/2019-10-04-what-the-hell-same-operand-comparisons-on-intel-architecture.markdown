---
layout: post title: "What the hell: Same-operand comparisons on Intel
architecture" date: 2019-10-04 21:37 comments: true categories: 
- Infosec
  ---
# 

I was reading _The Shellcoder's Handbook_ and, in chapter one, the author
discusses how being able to recognize C-like language constructs in assembly
code as an important skill.

There is one example that was throwing me for a loop and I just couldn't seem to
understand what was going on despite reading all I could (especially references
on the `or`, `test`, `cmp`, and `jxx` instructions).

So I started writing this blog post but, by the time I finished, I _think_ I
figured it all out but I'm publishing this anyway in the hopes that somebody
corrects me if I'm wrong!

Okay, so, here's the C code that the book wanted me to recognize:

```
int number;
if (number < 0)
{
// do something
}
```

The IA32 assembly that the book translated this to is:

```
number dw 0
mv eax, number
or eax, eax
jge label
// code for 'no' condition
label:
//code for 'yes' condition'
```

What I was _really_ stuck on were the two lines:

```
or eax, eax
jge label
```

I knew that, following the `or` instruction, the value of `eax` was not going to
change. I also knew that the `or` instruction was also manipulating the `EFLAGS`
register and that the `jge` instruction was evaluating them. What I didn't
understand was _how_ this register was being manipulated nor evaluated.

I started by reading about the `or` instruction. According to a [logical
inclusive OR reference page](https://www.felixcloutier.com/x86/or), "the OF and
CF flags are cleared; the SF, ZF, and PF flags are set according to the result"
but what the heck did that even mean?

I then looked over the docs for the [`test`
instruction](https://www.felixcloutier.com/x86/test) before realizing that what
I really wanted was [cmp](https://www.felixcloutier.com/x86/cmp). I also looked
over the docs for [conditional jumps](https://www.felixcloutier.com/x86/jcc) but
was still confused!

In doing so, however, I read that the `cmp` instruction worked by subtracting
the operands and setting the affected flags while discarding the results. I felt
like I was getting closer but I still felt pretty stuck at this point.

Finally, I noticed that on the reference for the `cmp` instruction that it
referred to an appendix to the Intel software developer's manual called _EFLAGS
Condition Codes_. I don't know how I missed this but it sounded promising!

Googling it led me to a PDF of the chapter _[EFLAGS Cross-Reference and
Condition Codes](https://www.cs.utexas.edu/~byoung/cs429/condition-codes.pdf)_
which finally cleared things up for me.

So, what the logical `or` comparison does is:

* Sets the zero flag (`ZF`) high if the result of the _subtraction_ operation is
  zero (i.e. the operands are the same) -- in our case, the operands are the
  same so we can ignore this flag
* Sets the parity flag (`PF`) high if there is an even number of bits sets -- we
  can ignore this too
* Resets the overflow (`OF`) and carry (`CF`) flags so we can ignore these too
  in our case (sort of)
* Sets the sign flag (`SF`) high if result of the _logical OR's_ sign (aka the
  most significant bit) is high

Uhh, okay...

So what reading and grokking this appendix eventually told me was that what the
`jge` instruction really does is evaluate the expression `(SF xOR OF) = 0`.

This finally made sense, I think! Based on `number`:

* the `SF` flag is set high (`1`) if `number` is negative or low (`0`) if
  `number` is positive
* the `OF` flag is reset to zero

Given that, I think we can look at our code again and work through some
examples:

Okay, so say we let `number = -10` here. We wind up with:

```
mv eax, number  ; eax = -10
or eax, eax     ; eax = -10. SF=1, OF=0
jge label       ; (SF xOR OF) = 0 => (1 xOR 0) = 1 => jump!
```

Or `number = 10` this time:

```
mv eax, number  ; eax = 10
or eax, eax     ; eax = 10. SF=0, OF=0
jge label       ; (SF xOR OF) = 0 => (0 xOR 0) = 0 => don't jump
```

Finally, let's test our boundary, zero:

```
mv eax, number  ; eax = 0
or eax, eax     ; eax = 0. SF=0, OF=0
jge label       ; (SF xOR OF) = 0 => (0 xOR 0) = 0 => don't jump
```

Does this all seem correct to you? Is it making sense? If not, please let me
know!

If it does, what are some other hard-to-find things you've learned in this vein?