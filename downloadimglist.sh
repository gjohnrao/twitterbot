#!/bin/bash
#This scripts scrapes the reddit url you specify and extracts all imgur links
#and filters out the useless links we can't use on Facebook (e.g. gifv)
#
#Change the subreddit to the url you want, default is blackpeopletwitter because
#it has content that is usually pretty popular on FB, but do change it to a
#subreddit with  content that works with your niche
#
#the imgur links are stored in imglistUniq

rm memes
wget --follow-tags=html  http://reddit.com/r/memes
grep -Po '(?<=href=")[^"]*' memes |grep imgur.com/|grep -v mailto:|grep -v domain/ |grep -v .gifv|grep -v gallery|grep -v /a/ |sort|uniq >combifile
cat combifile|grep .jpg>jpgonlyfile
cat combifile|grep -v .jpg|awk '{print $1".jpg"}'>nojpgfile
cat jpgonlyfile nojpgfile>>imglist
cat imglist|sort|uniq>imglistUniq
rm combifile
rm jpgonlyfile
rm nojpgfile
echo "imglistUniq updated"





