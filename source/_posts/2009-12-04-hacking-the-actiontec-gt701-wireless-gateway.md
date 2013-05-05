---
title: Hacking the Actiontec GT701 Wireless Gateway
author: Charles Hooper
comments: true
layout: post
permalink: /blog/hacking-the-actiontec-gt701-wireless-gateway/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8251576";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/hacking-the-actiontec-gt701-wireless-gateway
categories:
  - Projects
  - Uncategorized
---
# 

**Introduction**

This paper is our attempt to deobfuscate the **Actiontec GT701 wireless gateway**. There are a couple of other websites out there with the same goal in mind, however, our intent was to provide accurate  
information based off of various sources including both *official and un-official documentation, kernel source, configuration files, and just plain hacking.*

In addition to providing you with enough information to be able to
*build your own custom firmware*, we also mirror the files you need for
[SquashFS filesystem support under Linux as well as the official release
of the Actiontec source][1] \*.

 [1]: http://subversity.net/articles/downloads.html

\* Note: I am currently restoring this article. I will upload these files and update this link when I have them mirrored again.

**Hardware**

The hardware making up this unit revolves around the AR7, the AR7 is Texas Instruments’ “system on a chip” solution for DSL routers. The hardware of the GT701 (or any other AR7-based device for that matter,) consists of a power supply, the 160Mhz MIPS 4KEc V4.8 processor, 16Mb of SDRAM, and 4Mb of FLASH. For your input/output, there’s the RJ-11 for your DSL, your ethernet device (TI Avalanche CPMAC) jack, a USB port, and an ACX-11x based (chip # TNETW130) wireless setup as well as 6 status LEDs. On the board, there are also two separate sets of 5 pins each. These are mostly believed to be serial (JTAG is also possible) due to Texas Instruments displaying a serial/UART interface on the AR7 diagrams, several pins being attached to the board, and due to the following ADAM2 variables:

    modetty0        38400,n,8,1,hw  
    modetty1        38400,n,8,1,hw  
    bootserport     tty0  
    

**ADAM2**

To be perfectly honest, we’re still not entirely too sure what ADAM2 really is. We know that it’s stored on block 2 of the MTD device. We also know that that it appears to be some sort of system for storing environment variables in flash used during both boot-time and run-time, as well as a boot-loader of some sort. We also know that it’s responsible for storing the MAC addresses, as found in our mtd dump:

    Error: environment variable "maca" not set.  
    Setting default mac address : 00:e0:a0:a6:66:70  
    

The following is a dump of /proc/ticfg/env, which is the /proc interface to ADAM2.

    # cat /proc/ticfg/env  
    memsize 0x01000000  
    flashsize       0x00400000  
    modetty0        38400,n,8,1,hw  
    modetty1        38400,n,8,1,hw  
    bootserport     tty0  
    cpufrequency    150000000  
    sysfrequency    125000000  
    bootloaderVersion       0.22.02  
    ProductID       GT701-WG  
    HWRevision      2A  
    SerialNumber    none  
    AEIBootVersion  0.2i  
    my_ipaddress    192.168.0.1  
    prompt  Adam2_AR7DB  
    firstfreeaddress        0x9401d328  
    req_fullrate_freq       125000000  
    maca    00:20:E0:1D:95:F4  
    mtd2    0x90000000,0x90010000  
    mtd1    0x90010000,0x900d0000  
    mtd0    0x900d0000,0x903e0000  
    mtd3    0x903f0000,0x90400000  
    macb    00:20:E0:1D:95:F5  
    macc    00:20:E0:1D:95:F6  
    usb_board_mac   00:20:E0:1D:95:F8  
    usb_rndis_mac   00:20:E0:1D:95:F9  
    mac_ap  00:20:E0:1D:95:F7  
    autoload        1  
    mtd4    0x903e0000,0x903f0000  
    usb_pid 0x6010  
    usb_vid 0x1668  
    man     Actiontec Electronics, Inc.  
    prod    Actiontec USB/Ethernet Home DSL Modem  
    

When you hold down the Reset button during boot, an FTP server is spawned on the default port (TCP/21) typically allowing you to flash new firmware, as well as set and unset different ADAM2 environment variables.

The following is a list of commands that the ADAM2 FTP server supports.

    REBOOT          UNSETENV        SETENV          GETENV  
    MEDIA           RETR            TYPE            STOR  
    P@SW            PASV            SYST            PASS  
    USER            PORT            QUIT            ABOR  
    

When Actiontec’s recovery app is run, it also sends a UDP packet to port 5035, and then initiates a connection to the FTP port. The following is the output of a sniffed connection of a typical firmware upgrade.

    UDP broadcast port 5035: (16 bytes)  
    0x00 0x00 0x16 0x02 0x01 0x00 0x00 0x00  
    0xc0 0xa8 0x00 0x01 0x00 0x00 0x00 0x00  
    UDP response from modem to port 5035: (16 bytes)  
    0x00 0x00 0x16 0x02 0x02 0x00 0x00 0x00  
    0x01 0x00 0xa8 0xc0 0x00 0x00 0x00 0x00  
      
    220 ADAM2 FTP Server ready.  
    USER adam2  
    331 Password required for adam2.  
    PASS adam2  
    230 User adam2 successfully logged in.  
    TYPE I  
    200 Type set to I.  
    MEDIA FLSH  
    200 Media set to FLSH.  
    PORT 192,168,0,102,130,11  
    200 Port command successful.  
    STOR nsp.ar7wrd.squashfs.img mtd0  
    150 Opening BINARY mode data connection for file transfer.  
    226 Transfer complete.  
    TYPE I  
    200 Type set to I.  
    MEDIA FLSH  
    200 Media set to FLSH.  
    PORT 192,168,0,102,130,12  
    200 Port command successful.  
    STOR ram_zimage_pad.ar7wrd.nsp.squashfs.bin mtd1  
    150 Opening BINARY mode data connection for file transfer.  
    226 Transfer complete.  
    TYPE I  
    200 Type set to I.  
    MEDIA FLSH  
    200 Media set to FLSH.  
    PORT 192,168,0,102,130,13  
    200 Port command successful.  
    STOR config.xml mtd3  
    150 Opening BINARY mode data connection for file transfer.  
    226 Transfer complete.  
    REBOOT  
    221-Thank you for using the FTP service on ADAM2.  
    221 Goodbye.  
    QUIT  
    

The Actiontec GT701′s MTD blocks are set up as follows:

    mtd0            3,136K     Root (SquashFS - compressed filesystem)  
    mtd1            768K       Kernel  
    mtd2            64K        ADAM2  
    mtd3            64K        config.xml  
    mtd4            64K        unknown/unused  
    

We’re not too sure what else it is capable of, but there are some hints of it being able to boot off the network (DHCP,) and/or booting specified images. Here are some ADAM2 commands, though we haven’t actually been able to test these yet:

    fixenv         Defragment for Env. space  
    unsetenv       Unsets the Env. variable   
    setenv         Sets Env. variable  with a value   
    printenv       Displays Env. Variables  
    erase          Erase Flash except Adam2 Kernel and Env space  
    setmfreq       Configures/dumps the system and cpu frequencies  
    memop          Memory Optimization  
    info           Displays board information  
    h/help         Displays the commands supported  
    

There are others, but some of the command names didn’t show up, only the descriptions, and we don’t have a console hooked up to see them for ourselves yet.

**Software**

The Actiontec GT701 runs off of Linux kernel 2.4.17 patched for MIPS, ATM, SquashFS, and pre-empt (not enabled.) The kernel is provided by MontaVista and is believed to be the MontaVista Carrier Grade Linux kernel version 2.1.

Linux version 2.4.17\_mvl21-malta-mips\_fp_le () (gcc version 2.95.3 20010315 (release/MontaVista)) #24 Fri Jul 16 13:22:25 PDT 2004

Along with the kernel, the GT701 also runs on top of Busybox 0.61.pre with uClibc libraries (version 0.9.19.) The root filesystem uses SquashFS 1.x, which is a compressed, read-only filesystem stored on the MTD block. One should note that SquashFS 2.x is not backwards-compatible with 1.x. A ramdisk is mounted at /var and any files that require write access or either stored there, or symlinked to that tree.

In order to retrieve and edit the file system one would first have to download SquashFS and compile it into their kernel, as well as build the user-land tools. Once this is complete your first step would be to either extract nsp.ar7wrd.squashfs.img from the recovery tool, or do something similar to the following (while running a tftp server):

    # dd if=/dev/mtdblock/0 of=/var/mtd0  
    6272 0 records in  
    6272 0 records out  
    # tftp -p -l /var/mtd0 -p mtd0.img   
    

This will give you a mountable SquashFS image wherever you you placed your tftp root. In order to to write to it though, you will need to copy a mounted SquashFS directory to a non-SquashFS directory as follows:

    # mkdir temp fs  
    # mount -o loop -t squashfs mtd0.img temp/  
    # cp -R temp/ fs/  
      
    

And you now have a write-able directory to edit/delete or whatever else may please you. Re-creating the image is just as easy:

    # mksquashfs target.old/ target.img -noappend -check_data  
    Creating little endian filesystem on target.img, block size 32768.  
      
    Little endian filesystem, data block size 32768, compressed data, compressed metadata  
    Filesystem size 1897.99 Kbytes (1.85 Mbytes)  
    33.35% of uncompressed filesystem size (5691.04 Kbytes)  
    --- Output cut ---  
    

There are two things to keep in mind while building filesystem images. The first is that the GT701 can only STORE 3,136K (compressed) on the FLASH chip. You should at this point, also realize that the filesystem is decompressed and stored in RAM when mounted, and you only have 16Mb RAM to begin with, so either way, it’s a tight fit.

Actiontec uses a set of utilities to manage your configuration files. They manage the XML file stored on mtd3 as well as handle your web-based configuraiton changes. There is also supposed to be a CLI client for it, however, I haven’t quite figured out how that works yet. These utilities can usually be identified by having “cm_” as a prefix, although the CGI program for the web-based configuration is called “webcm,” and of course, we can’t forget libcm.so. The XML file contains all of your coniguration, including IP addresses, authentication, networking settings, and probably just about everything else. You can extract a current version of the file the same way we demonstrated dumping the filesystem above, but by replacing mtd0 with mtd3. You will also need to strip all of the excess garbage at the end of the file. I should also note that that mtd3 is monitored regularly for corruption, and if mtd3 happens to become corrupted, it will repopulate the block with /etc/config.xml.

The list of configuration programs is as follows:

    cm_pc             Started at boot, stdout is /dev/tts/0,starts cm_logic  
    and cm_monitor  
      
    cm_logic          Monitors and re-populates mtd3  
    cm_monitor        ? ... Not exactly sure.  
    cm_cli            Used to perform the actual updating of the config files.  
    webcm             Handles web-based configuration changes, sends them off  
    to cm_cli  
    

Webcm is used in conjunction with thttpd to provide a small, yet working, web-based interface to allow you to make changes to your gateway’s configuration.

As far as networking is concerned, the GT701 used pppd with a PPPoA plugin for your connection to your ISP. For telnet and DHCP, the gateway uses utelnetd and udhcpd, respectively. The Actiontec GT701 also supports UPNP through the use of upnpd on interfaces ppp0 and br0. br0 consists of the USB device, the Ethernet device, and the wireless device.

The wireless drivers are not compiled into the kernel or as a kernel module, rather, they are handled by a userland driver called user\_drv. On the original firmware, the user\_drv_cli utility provided a very capable command line interface that allowed you to change many settings pertaining to the wireless network device. Some of these settings included what Regulatory domain you were in, for instane, one could take their access point out of the FCC domain, and place it under the French domain, or better yet, a custom domain, and change power levels, as well as usable channels. In the newer firmware, it seems this software has been crippled, and will not allow you to access the CLI.

**Conclusion**

The Actiontec GT701-wg is a powerful embedded Linux device running on a MIPS platform based off of Texas Instruments’ AR7 “one-chip” solution. It is relatively easy to hack the GT701. The firmware images are squashFS 1.x images and the base Linux system is run on BusyBox with the uClibc libraries. If one were to set up a cross-compile environment and use the squashFS tools they could generate new firmware images with great ease.
