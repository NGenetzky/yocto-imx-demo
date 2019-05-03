
# Setup Project with IMX BSP

## Setup Environment (new)

Setup or reset build configuration.

```
cd ~/yocto-imx-demo/bsp/imx
MACHINE='imx8mqevk' DISTRO='fsl-imx-wayland' source ./fsl-setup-release.sh -b '../../projects/imx8-gtec-demo/build'
```

## Setup Environment (existing)

Setup environment to build with existing configuration:

```
cd ~/yocto-imx-demo/bsp/imx
source setup-environment  ../../projects/imx8-gtec-demo/build/
```

# Bake some bits

Here are a few things you could build:

```bash
# Standard Yocto
bitbake core-image-minimal

# ESDK and buildtools from Yocto
bitbake meta-toolchain
bitbake meta-ide-support

# FSL specific image
bitbake imx-gpu-sdk
bitbake fsl-image-gui
```
