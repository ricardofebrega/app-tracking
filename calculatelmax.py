#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Fri Aug  4 20:06:19 2017

@author: lindseykitchell
"""

import sys

# get bvals path from the first argument
f = open(sys.argv[1], 'r')
line = f.readline().strip().replace(",", " ")
bvals = line.split(" ")
bvals_non0 = filter(lambda v: v != "0", bvals)
count=len(bvals_non0);

#calculate max lmax (6->2, 15->4, 28->6, etc..)
lmax=0
while (lmax+3)*(lmax+4)/2 <= count:
       lmax+=2

print lmax

