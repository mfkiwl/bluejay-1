#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Mar 21 00:10:48 PDT 2023
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim tb_behav -key {Behavioral:sim_1:Functional:tb} -tclbatch tb.tcl -view /home/seankent/bluejay/vivado/bluejay/tb_behav.wcfg -log simulate.log"
xsim tb_behav -key {Behavioral:sim_1:Functional:tb} -tclbatch tb.tcl -view /home/seankent/bluejay/vivado/bluejay/tb_behav.wcfg -log simulate.log

