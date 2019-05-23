#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

DEFAULT_BSP="${SCRIPTDIR}/../bsp/imx/"
DEFAULT_BUILDDIR="${SCRIPTDIR}/../projects/imx8-gtec-demo/build/"

main(){
    local relative_builddir
    relative_builddir="$(realpath --relative-to "${DEFAULT_BSP}" "${DEFAULT_BUILDDIR}")"

    cd "${DEFAULT_BSP}"

    # Some hacky stuff is required to use setup-environment
    set +u # They use unset variables (gross)
    source setup-environment "${relative_builddir}"


    # Standard Yocto
    bitbake core-image-minimal

    # ESDK and buildtools from Yocto
    bitbake meta-toolchain meta-ide-support

    # FSL specific image
    bitbake imx-gpu-sdk fsl-image-gui
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
