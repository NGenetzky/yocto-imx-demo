#!/bin/bash
# Reference: https://source.android.com/setup/build/downloading

DEFAULT_BINDIR="${HOME}/bin/"

install_repo_tool(){
    local bindir

    if [ -x "$(command -v repo)" ]; then
        echo 'OK: repo tool already setup'
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

check_git_config(){
    local rtcode
    rtcode=0
    if  ! git config --get user.name > /dev/null ; then
        printf 'Please execute the following with your info:\n%s\n' \
            'git config --set user.name "FirstName LastName'
        rtcode=1
    fi
    if  ! git config --get user.email > /dev/null ; then
        printf 'Please execute the following with your info:\n%s\n' \
            'git config --set user.email "FirstName.LastName@example.com'
        rtcode=1
    fi
    return $rtcode
}

main(){
    install_repo_tool
    check_git_config
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
