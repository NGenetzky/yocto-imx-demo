#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
D_PROJECTS="${SCRIPTDIR}/../projects/"

DEFAULT_BSP="${SCRIPTDIR}/../bsp/imx/"
DEFAULT_PROJNAME="bsp-imx8"

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
    local projname bspdir builddir relative_builddir
    projname="${1-${DEFAULT_PROJNAME}}"

    bspdir="${DEFAULT_BSP}"
    [ -d "${bspdir}" ] || die 1 "Please setup-bsp-imx.bash"

    projdir="${D_PROJECTS}/${projname}/"
    [ -d "${projdir}" ] || mkdir "${projdir}"

    builddir="${projdir}/build/"
    [ -d "${builddir}" ] && warn "reinit builddir ('${builddir}')."

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
