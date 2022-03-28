# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
if [[ ${PV} == *9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/ZenithDS/SpotiFetch.git"
else
        SRC_URI="https://github.com/LinusDierheimer/fastfetch/archive/refs/tags/${PV}.tar.gz"
        KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
