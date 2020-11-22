#!/usr/bin/env sh

set -e

cd $(dirname "$0")

iverilog -o nucleo_demo test/tb.v src/cnt_iter.v src/flag.v src/regi.v src/dec.v

vvp nucleo_demo -lxt2

#gtkwave dump.lx2
