#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

DEFAULT_BSP="${SCRIPTDIR}/../bsp/imx/"
DEFAULT_BUILDDIR="${SCRIPTDIR}/../projects/imx8-gtec-demo/build/"

warn () {
    echo "$0:" "$@" >&2
}

die () {
    rc="$1"
    shift
    warn "$@"
    exit "$rc"
}

main(){
    local bspdir builddir relative_builddir

    bspdir="${DEFAULT_BSP}"
    [ -d "${bspdir}" ] || die 1 "Please setup-bsp-imx.bash"

    builddir="${DEFAULT_BUILDDIR}"
    [ -d "${builddir}" ] && die 2 "Please remove builddir ('${builddir}')."

    relative_builddir="$(realpath --relative-to "${bspdir}" "${builddir}")"

    cd "${bspdir}"
    set +u
    MACHINE='imx8mqevk' DISTRO='fsl-imx-wayland' source ./fsl-setup-release.sh -b "${relative_builddir}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
