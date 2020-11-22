#!/usr/bin/env sh

set -e

cd $(dirname "$0")

ghdl -a --std=08 src/regi.vhd
ghdl -a --std=08 src/flag.vhd
ghdl -a --std=08 src/dec.vhd
ghdl -a --std=08 src/cnt_iter.vhd
ghdl -a --std=08 test/tb.vhd

ghdl -e --std=08 tb

ghdl -r tb --wave=wave.ghw

gtkwave wave.ghw
