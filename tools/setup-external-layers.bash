#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
DEFAULT_DEST="${SCRIPTDIR}/../external/"

update_repo() {
	uri=$1
	path=$2
	rev=$3

	# check if we already have it checked out, if so we just want to update
	if [[ -d ${path} ]]; then
		pushd ${path} > /dev/null
		echo "Updating '${path}'"
		git remote set-url origin "${uri}"
		# git fetch --tags origin
	else
		echo "Cloning '${path}'"
        git clone ${uri} ${path}
		pushd ${path} > /dev/null
	fi

	# Simplified logic to allow specifying tags, branches, and shas
	git checkout -f ${rev}
	popd > /dev/null
	echo "Updated '${path}' to '${rev}'"
}

main(){
    local dest="${1-${DEFAULT_DEST}}"

    mkdir -p "${dest}"

    update_repo \
        'https://github.com/Freescale/meta-fsl-demos.git' \
        "${dest}/meta-fsl-demos" \
        '19c44783151e5a387c65ae837e34544b4667b9be'
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi
