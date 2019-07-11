#!/bin/bash
# Reference: https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ubuntu-packages

yocto_hosttools_2_5_ubuntu(){
    sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
         build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
         xz-utils debianutils iputils-ping
}

main(){
    yocto_hosttools_2_5_ubuntu
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
