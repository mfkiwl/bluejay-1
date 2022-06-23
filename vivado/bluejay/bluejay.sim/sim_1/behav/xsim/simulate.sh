#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Jun 19 20:04:57 PDT 2022
# SW Build 3526262 on Mon Apr 18 15:47:01 MDT 2022
#
# IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim jay__tb_behav -key {Behavioral:sim_1:Functional:jay__tb} -tclbatch jay__tb.tcl -view /home/seankent/bluejay/vivado/bluejay/top_tb_behav.wcfg -log simulate.log"
xsim jay__tb_behav -key {Behavioral:sim_1:Functional:jay__tb} -tclbatch jay__tb.tcl -view /home/seankent/bluejay/vivado/bluejay/top_tb_behav.wcfg -log simulate.log
