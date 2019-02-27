###################################################################################################
# Appends the device-tree recipe to add the additional dts file provided in the sub-directory.
# Copyright Richard Dunkley 2018
###################################################################################################

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# device tree sources for our generic image
COMPATIBLE_MACHINE_generic-zynq7 = ".*"
SRC_URI_append_generic-zynq7 = " file://generic-zynq7.dts"

