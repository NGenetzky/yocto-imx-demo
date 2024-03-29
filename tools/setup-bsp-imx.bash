#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
DEFAULT_DEST="${SCRIPTDIR}/../bsp/imx/"

main(){
    local dest="${1-${DEFAULT_DEST}}"

    mkdir -p "${dest}"
    pushd "${dest}"
    repo init \
        -u 'https://source.codeaurora.org/external/imx/imx-manifest' \
        -b 'imx-linux-sumo'
    repo sync
    popd
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
