# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="ncurses"

inherit python-r1

DESCRIPTION="A tool to display color charts for 8, 16, 88, and 256 color terminals"
HOMEPAGE="http://zhar.net/projects/shell/terminal-colors"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/eikenb/${PN}.git"
	S="${WORKDIR}"
else
	SRC_URI="https://github.com/eikenb/${PN}/archive/refs/tags/v${PV}.tar.gz"
	S="${WORKDIR}"
	KEYWORDS="~amd64 ~x86 ~x64-macos"
fi

LICENSE="GPL-3+"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}"

PATCHES=(
	"${FILESDIR}/${PN}-3.0.2.patch"
)

src_prepare() {
	default

	eapply_user
}

src_install() {
	cd "${S}/${P}"
	emake INSTALL_DIR="${WORKDIR}" install
	rm -rf "${WORKDIR}/${P}" || die
	python_scriptinto /usr/bin
	python_newscript "${PN}.py" "${PN}"
}
