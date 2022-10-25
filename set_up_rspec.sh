#!/bin/zsh

# Simple script to set up Git and RSpec for a Ruby project
# as per instructions on https://github.com/makersacademy/golden-square/blob/main/pills/setting_up_an_rspec_project.md

gem install bundler
echo "[+] bundler installed"
bundle init
echo "[+] bundler initialized"
bundle add rspec
echo "[+] rspec added"
rspec --init
echo "[+] rspec initialized"
mkdir lib
echo "[+] lib folder created"
git init .
echo "[+] git initialized"
echo "[!] ready to commit \"Project Setup\""