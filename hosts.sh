#!/usr/bin/env bash

# Temp hosts directory
hosts_dir="/tmp/hosts.$(date +%s | md5 | base64 | head -c 32; echo)"
git clone https://github.com/StevenBlack/hosts $hosts_dir

# Link domain lists from dotfiles
[ -f "$DOTFILES/blacklist" ] && ln -fs $DOTFILES/blacklist $hosts_dir/blacklist
[ -f "$DOTFILES/whitelist" ] && ln -fs $DOTFILES/whitelist $hosts_dir/whitelist

# Link domain list from args, ./hosts.sh ../foo/myhosts
if [ -n "$1" ]; then
  cd $(dirname $1)
  myhosts=$PWD/$(basename $1)

  if [ -f "$myhosts" ]; then
    ln -fs $myhosts $hosts_dir/myhosts
  fi
fi

cd $hosts_dir

# Patch /etc/hosts
pip3 install --user -r requirements.txt
python3 updateHostsFile.py -a -f -r -e fakenews gambling porn social

rm -rf $hosts_dir
