#!/bin/sh

cp ~/.vimrc ./vimrc
cp ~/.shell_prompt.sh ./shell_prompt.sh

git add vimrc shell_prompt.sh
git commit -m "conf_files"
git push
