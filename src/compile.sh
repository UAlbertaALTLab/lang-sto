#!/bin/bash
cat sto-stems.lexc sto-suff.lexc > sto-post.lexc
foma -l sto-master.xfscript
