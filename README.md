# meta-generic-zynq
Provides a Yocto layer for configuring images targeting generic or custom Zynq development boards. This layer can either be used as a template or can be used directly by placing board specific files into the layer.

## Dependencies
This layer depends on:

URI | Layers | Branch
--- | ------ | ------
git://git.openembedded.org/bitbake | | rocko
git://git.openembedded.org/openembedded-core | meta | rocko
git://git.yoctoproject.org/meta | meta | rocko
git://git.yoctoproject.org/meta-xilinx | meta-xilinx | rocko

## Patches
Please submit any patches against this layer using pull requests in github or open up an issue.

## Table of Contents
1. Adding the meta-generic-zynq to your build
2. Change the device-tree
3. Changing the Zynq configuration
4. Changing the Linux Kernel

### 1. Adding the meta-generic-zynq to your build
In order to use this layer, you need to make the build system aware of it.

Assuming the meta-generic-zynq layer exists at the top-level of your yocto build tree, you can add it to the build system by adding the location of the layer to bblayers.conf, after meta-xilinx has been added. e.g.:

```
  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-poky \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-xilinx \
    /path/to/yocto/meta-generic-zynq \
    "
```

### 2. Change the device-tree
The device tree used for the build is contained in the following location:

- /recipes-bsp/device-tree/files/generic-zynq7.dts
- /recipes-bsp/u-boot/files/generic-zynq7.dts

Both locations must be updated to with a new device-tree configuration. One location is used by the Linux kernel and
the other location is used by U-boot.

### 3. Changing the Zynq configuration
U-boot uses platform initialization files to setup the appropriate registers of the Zynq processor. These files include a C file and associated header file. They are generated as part of the HDF file in Vivado. You can open the HDF file with a zip utility and extract out the ps7_init_gpl.c and ps7_init_gpl.h files. These files should be placed in the following folder:

/recipes-bsp/u-boot/files/platform_init/



