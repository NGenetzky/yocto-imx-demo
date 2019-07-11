#!/bin/bash
# Reference: https://source.android.com/setup/build/downloading

DEFAULT_BINDIR="${HOME}/bin/"

install_repo_tool(){
    local bindir

    if [ -x "$(command -v repo)" ]; then
        echo 'repo tool already setup'
        return 0
    fi

    bindir="${DEFAULT_BINDIR}"
    [ -d "${bindir}" ] || mkdir "${bindir}"
    PATH="${bindir}:$PATH"
    export PATH

    curl https://storage.googleapis.com/git-repo-downloads/repo > "${bindir}/repo"
    chmod a+x "${bindir}/repo"

    which repo > /dev/null
    if [ ! -x "$(command -v repo)" ]; then
        echo 'repo tool setup failed'
        return 1
    fi
    return 0
}

main(){
    install_repo_tool
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
