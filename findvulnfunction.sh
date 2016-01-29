#!/bin/bash
#copyright (c) 2016 Justin Keller
#script for looking for vulnerable functions in a binary
if [ -z $1 ]; then
echo usage: $0 binaryfile
exit(-1)
fi
echo testing for strcpy
strings -t x $1 | grep strcpy 
echo testing for gets 
strings  -t x $1 | grep gets
echo testing for strcat
strings -t x $1 | grep strcat
echo testing for sprintf and vsprintf 
strings -t x $1 | grep sprintf
strings -t x $1 | grep vsprintf 
echo testing for va_ (varargs)
strings -t x $1 | grep va_.*
echo testing for fixme
strings -t x $1 | grep -i fixme
