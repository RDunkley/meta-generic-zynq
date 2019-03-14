###################################################################################################
# Appends the Yocto Linux recipe. This file allows you to quickly remove or add some components to
# the kernel without having to run menuconfig.
#
# Copyright Richard Dunkley 2019
###################################################################################################

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"

SRC_URI += " \
	file://add_fpga_prog.cfg \
	"

