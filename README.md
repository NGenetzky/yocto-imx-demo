
# yocto-imx-demo

A demonstration of GPU capabilities of the 'imx8mqevk' machine.

## Structure

```
→ ls -1
bsp
external
projects
README.md
tools
```

- external: external projects
- bsp: external projects released as a official "bsp"
- projects: projects focused on a particular machine and distribution
- tools: Scripts to setup and use the repository

## projects/imx8-gtec-demo

[gtec-demo-framework](https://github.com/NXPmicro/gtec-demo-framework) has been
compiled for the
[imx8mqevk](http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/conf/machine/imx8mqevk.conf?h=master)
machine.  BSP support for this machine is not in
[fsl-community-bsp](https://github.com/Freescale/fsl-community-bsp-platform),
but it is provided by
[imx-manifest](https://source.codeaurora.org/external/imx/imx-manifest/log/?h=imx-linux-sumo)
This is made possible by this awesome layer:
[meta-fsl-demos](https://layers.openembedded.org/layerindex/branch/sumo/layer/meta-fsl-demos/).

This project has a README.md that can be followed for manual development.
Otherwise the following script (`./tools/build-imx8-gtec-demo.bash`) has been
created to build a few common targets.
