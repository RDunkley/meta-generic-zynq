###################################################################################################
# Appends U-boot recipe to add the platform initialization files and device tree configuration.
# Copyright Richard Dunkley 2018
###################################################################################################

# Signal that we have a new platform init files for our generic configuration.
HAS_PLATFORM_INIT ?= " \
	zynq_generic_config \
	"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_generic-zynq7 = ".*"
SRC_URI_append_generic-zynq7 = " \
	file://platform_init/ps7_init_gpl.c \
	file://platform_init/ps7_init_gpl.h \
	file://zynq_generic_defconfig \
	file://generic-zynq7.dts \
	"

do_unpack_append () {
    bb.build.exec_func('do_modify_src', d)
}

do_modify_src() {
    mv ${WORKDIR}/platform_init ${S}/board/xilinx/zynq/zynq-generic
    mv ${WORKDIR}/zynq_generic_defconfig ${S}/configs
    mv ${WORKDIR}/generic-zynq7.dts ${S}/arch/arm/dts/zynq-generic.dts
}


