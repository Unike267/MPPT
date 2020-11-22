#!/usr/bin/env sh

set -e

cd $(dirname "$0")

iverilog nucleo_top.v cnt_iter.v  flag.v regi.v dec.v -o nucleo_demo

vvp nucleo_demo -lxt2

gtkwave dump.lx2
