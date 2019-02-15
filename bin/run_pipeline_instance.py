#!/usr/bin/env python
from argparse import ArgumentParser
import sys, glob, string

import subprocess

# remember that "cmd" needs to be a list, so I split() it.
# also, it seems "cmd" can't be of unit length. I use 'sh CMD' as a work-around
def shr(cmd):
  print(cmd.split())
  return(subprocess.getoutput(cmd.split()).split('\n'))

def shx(cmd):
  print(cmd.split())
  return(subprocess.call(cmd.split()))
  

"""
This bash script makes some TODO entries that can be tested
for A in 1 2 3 4; do echo "touch file_$A.txt" > script_$A.sh; chmod +x script_$A.sh ; done
"""


def main():

  #Don't currently need ArgumentParser

  while bool(glob.glob("TODO/*")):
    jobs = glob.glob("TODO/*") # sorted by name by defaulot
    job = jobs[0].split('/')[1]
    shx("mv TODO/{0} PROCESSING/{0}".format(job))
    shx("sh PROCESSING/{0}".format(job))
    shx("mv PROCESSING/{0} DONE/{0}".format(job))


if __name__ == "__main__":
  main()
