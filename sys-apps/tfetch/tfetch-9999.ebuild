# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit make

DESCRIPTION="Like pfetch but faster"
HOMEPAGE="https://github.com/Thamognya/TFetch"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Thamognya/TFetch.git"
else
	SRC_URI=""
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
fi
