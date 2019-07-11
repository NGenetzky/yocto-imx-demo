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
    curl https://storage.googleapis.com/git-repo-downloads/repo > "${bindir}/repo"
    chmod a+x "${bindir}/repo"

    if [ ! -x "$(command -v repo)" ]; then
        echo 'Reload terminal, and execute script again'
        printf "otherwise Please ensure %s is in your PATH\n" \
            "${bindir}"
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
