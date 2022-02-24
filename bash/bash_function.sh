#!/bin/bash

function stuff {
  if [ $1 == 1 ] ; then
    echo "yes"
  else
    echo "no"
  fi
}

stuff 2

exit
