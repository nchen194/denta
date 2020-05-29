#!/bin/sh
echo "文件名"
read wenjian
git add ${wenjian}
git commit -m ${wenjian}
git push -u origin master
