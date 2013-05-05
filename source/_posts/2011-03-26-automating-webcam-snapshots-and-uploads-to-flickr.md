---
title: Automating Webcam Snapshots and Uploads to Flickr
author: Charles Hooper
comments: true
layout: post
permalink: /blog/automating-webcam-snapshots-and-uploads-to-flickr/
has_been_twittered:
  - yes
categories:
  - Projects
  - Python
---
# 

With gardening season right around the corner, one of my desires was to set something up that would allow me to take automated, regular snapshots of some of my plants and upload them to flickr. After a few cumulative hours I finally cobbled together the solution.

## Taking the Snapshots

The first thing I needed to do was to take snapshots from an installed USB webcam and save them to a directory. This needed to be able to run from a cron script so obviously it needed to work without a GUI and without user-interaction. I read in a [Webcam Howto][1] that I could do this using **streamer** so I installed it and wrote a short shell script that would iterate through the video devices installed on my PC and run the snapshot command. You can [view the source of this script here][2].

 [1]: http://www.tldp.org/HOWTO/html_single/Webcam-HOWTO/#COMMAND
 [2]: https://bitbucket.org/hoop/snapshot/src/98aa5d9a2038/snapshot

## Uploading the Photos

Next I wanted to automatically upload the files to Flickr. At first, I tried using a script I found called uploadr.py which worked OK, but I also wanted to add my photos to a specific set which this script didn’t do. I probably could have extended its functionality, but this script didn’t use or implement the full Flickr API which made this task seem unnecessary.

Instead, I downloaded the [Python Flickr API from Stuvel][3] and in less than 90 lines I had working code to upload a directory of images to Flickr and add them to a given set. You can view the source to my [flickr uploader script][4] here, which I’m calling [simpleuploadr.py][5] for now.

 [3]: http://stuvel.eu/flickrapi
 [4]: https://bitbucket.org/hoop/snapshot/src/98aa5d9a2038/simpleuploadr.py
 [5]: https://bitbucket.org/hoop/snapshot

## Results

[Here are my pretty pictures][6] :) My apologies for the quality, I’m using a really cheap webcam.

 [6]: http://www.flickr.com/photos/hoop2w1/sets/72157626354700156/with/5620672632/


