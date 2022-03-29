# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="terminal emulator which mimics the look and feel of the old cathode tube screens"
HOMEPAGE="https://github.com/Swordfish90/cool-retro-term"


if [[ ${PV} == *9999 ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/ssleert/${PN}.git"
else
        SRC_URI="https://github.com/ssleert/${PN}/releases/download/${PV}/${P}.tar.gz"
        KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
fi


LICENSE="GPL-3.0"
SLOT="0"

DEPEND="
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
"

RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 DESTDIR="${D}" install
}
