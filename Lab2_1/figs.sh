#!/bin/bash
# Runs each lab figure; shows the command, then its output
run() { echo "\$ $1"; eval "$1"; }
next() {
  echo
  if [ -z "$NOPAUSE" ]; then read -p "[Figure $1 done - take screenshot, then press Enter] "; clear; fi
}
[ -z "$NOPAUSE" ] && clear

echo "### Figure 1"
run 'gcc --version | head -n 1'
run 'readelf --version | head -n 1'
run 'ldd --version | head -n 1'
run 'git --version'
next 1

echo "### Figure 2"
run 'cat procinfo.c'
next 2

echo "### Figure 3"
run 'gcc -Wall -Wextra procinfo.c -o procinfo'
run './procinfo'
next 3

echo "### Figure 4"
run 'ls -l /usr/include/stdio.h /usr/include/unistd.h'
run 'grep -n -m 1 "extern int printf" /usr/include/stdio.h'
run 'grep -n -m 1 "getpid (void)" /usr/include/unistd.h'
next 4

echo "### Figure 5"
run 'ls -lh /usr/lib/aarch64-linux-gnu/libc.so.6'
run 'ls -lh /usr/lib/aarch64-linux-gnu/libc.a'
next 5

echo "### Figure 6"
run 'gcc procinfo.c -o procinfo_dynamic'
run 'gcc -static procinfo.c -o procinfo_static'
run 'ls -lh procinfo_dynamic procinfo_static'
run 'file procinfo_dynamic procinfo_static'
next 6

echo "### Figure 7"
run 'readelf -d procinfo_dynamic | grep NEEDED'
run 'readelf -d procinfo_static'
next 7

echo "### Figure 8"
run 'ldd procinfo_dynamic'
run 'ldd procinfo_static'
next 8

echo "### Figure 9"
run 'readelf -h procinfo_dynamic | grep -E "Magic|Class|Data|Type|Machine|Entry point"'
next 9

echo "### Figure 10"
run 'readelf -W -l procinfo_dynamic | grep -E "INTERP|LOAD|GNU_STACK|interpreter"'
next 10
