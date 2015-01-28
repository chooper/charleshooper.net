---
title: 'Minesweeper hacking &#8211; Viewing process memory in Windows'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/minesweeper-hacking-viewing-process-memory-in-windows/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8248786";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/minesweeper-hacking-viewing-process-memory-in
categories:
  - Projects
  - Uncategorized
---
# 

I wrote a very simple program to read Minesweeper’s memory and display a grid showing where the bombs are. I used OllyDbg for disassembly and reversing and CheatEngine for quickly finding known values in memory. During this process, I found that Minesweeper will sometimes *assist you* and move bombs away from where you are clicking on. Originally, I thought that Minesweeper was only “spawning” about half of the bombs, but as it turns out I misunderstood the way minefield was represented in memory and all bombs *are* generated at the *beginning* of the game and not first click or any later clicks.

My error was in thinking that minefield was stored in a 2-dimensional array (ie: `minefield[x][y] = FLAGS`) where *max(x)* (and *max(y)*) are the size of the grid (ie: 9×9 on Beginner) but as [xumiiz on Reddit][1] pointed out:

 [1]: http://www.reddit.com/user/xumiiz/

> His program is buggy. It’s not reading the grid in correctly – it’s a constant width of 32 bytes, but a window from the top left is taken for the actual size of the playing field. So, first bugfix to his source:
> 
> ` for(DWORD grid_loc = 0; grid_loc < grid_height * grid_width; grid_loc  ) {`
> 
> should be:
> 
> ` for(DWORD grid_loc = 0; grid_loc < grid_height * 32; grid_loc  = ((grid_loc2)==(grid_width-1)) ? (32-grid_width 1):1) {`
> 
> And:
> 
> `if((grid_loc % grid_width) == (grid_width - 1))`
> 
> should be changed to:
> 
> ` if((grid_loc % 32) == (grid_width - 1))`
> 
> With these fixes, it reads all the bombs properly.

And also [this comment from Anonymous][2]:

 [2]: http://www.subversity.net/reversing/hacking-minesweeper#comment-33

> Sorry but your program is reading the grid incorrectly. Minesweeper uses a grid with a fixed width of 32 bytes and the playing field is taken as a window of that grid from the top left. e.g. beginner mode uses bytes 0 to 8 and skips bytes 9 to 31 per every 32 byte row.* Fixing the program to read based on that patten shows that Minesweeper only moves the mine if it happens to be the first square you click on. Apart from that, all mines are randomly placed at the start of the game. (* Actually it would use bytes 0 to 10, where bytes 0 and 10 are 0×10 which is to indicate the border of the mine field, and bytes 1 to 9 are the actual squares. but that’s not really relevant to the analysis if you’re just &ing with 0×80 to find bombs.)

The program is available here: [Minehack Source][3] | [Minehack Source & Binary (ZIP)][4]

 [3]: http://sub-public.s3.amazonaws.com/minehack/minehack.cpp
 [4]: http://sub-public.s3.amazonaws.com/minehack/minehack.zip

*I have released a binary, and the software has been placed under the
[BSD License][5]. Many thanks to the people and sites who linked me,
people who posted comments, most definitely the contributors, but most
importantly: the readers.*

 [5]: http://sub-public.s3.amazonaws.com/minehack/license.txt
