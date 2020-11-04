#!/bin/bash

FLOWDIR="flows"
PORT=8118

#if [ "$1" == "-c" ]; then
#  CMD="mitmproxy"
#else
#  CMD="mitmdump"
#fi

# TODO: parse args properly (position-independant)
if [ "$1" == "-d" ]; then
  CMD="mitmproxy"
  if [ ! -d "$FLOWDIR" ]; then
    mkdir "$FLOWDIR"
  fi
  DUMPFILE="$FLOWDIR/log-`date +%s`.flows"
  echo "* Starting proxy server $CMD on port $PORT..."
  echo "* Dumping data to $DUMPFILE..."
  $CMD -s adblock.py -p $PORT -w "$DUMPFILE" --set stream_large_bodies=100k
else
  CMD="mitmdump"
  echo "* Starting proxy server $CMD on port $PORT..."
  $CMD -s adblock.py -p $PORT --set stream_large_bodies=100k
fi
