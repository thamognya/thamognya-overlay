# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Yet another system fetch that is minimal and customizable."
HOMEPAGE="https://github.com/deepjyoti30/yaf"
SRC_URI="https://github.com/deepjyoti30/yaf/releases/download/${PV}/yaf-linux-amd64"
S="/var/tmp/portage/app-misc/yaf-bin-0.0.3/work/"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cp -r "${S}yaf-linux-amd64" /usr/bin/yaf
}

pkg_postrm() {
	rm -f /usr/bin/yaf
}
