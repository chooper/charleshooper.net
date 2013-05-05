---
title: Finding the Linux System Call table in 2.6 series kernels
author: Charles Hooper
comments: true
layout: post
permalink: /blog/finding-the-linux-system-call-table-in-2-6-series-kernels/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8251362";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/finding-the-linux-system-call-table-in-26-ser
categories:
  - Projects
  - Uncategorized
---
# 

I have been modifying [Sebek][1] to get it to work in more recent 2.6 series (~2.6.18) kernels and ran into some snags. Most notably, I could not intercept/redirect/wrap any system calls. As it turns out, Sebek couldn’t find the system call table. The code Sebek was using to find the system call table is 100% identical to the code found in [this article on KernelTrap][2].

 [1]: http://www.honeynet.org/tools/sebek/
 [2]: http://kerneltrap.org/node/6416

Unfortunately, that code is outdated as either `loops_per_jiffy`, `boot_cpu_data`, or `sys_call_table` appear to have been moved. I found that I could find the system call table between `unlock_kernel` and `loops_per_jiffy` and have modified the code as follows.

    // -----------------------------------------------------------------------------   
    // Sys Call Table Address  
    //-----------------------------------------------------------------------------  
    unsigned long **find_sys_call_table(void)  {  
    unsigned long **sctable;  
    unsigned long ptr;  
    extern int loops_per_jiffy;
          sctable = NULL;  
    for (ptr = (unsigned long)&unlock_kernel; ptr < (unsigned long)&loops_per_jiffy; ptr  = sizeof(void *))    {  
    unsigned long *p;  
    p = (unsigned long *)ptr;  
    if (p[__NR_close] == (unsigned long) sys_close)       {  
    sctable = (unsigned long **)p;  
    return &sctable[0];  
    }  
    }  
    return NULL;  
    }

 