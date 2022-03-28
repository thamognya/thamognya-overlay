# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Manga is a minimalistic line bash script that allows you to download and open a downloaded version of the manga of your choice."
HOMEPAGE="https://github.com/ThamognyaKodi/MangaFlix"
SRC_URI="https://github.com/ThamognyaKodi/MangaFlix/releases/download/${PN}/${P}.tar.gz"

LICENSE="MIT GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-text/zathura
		app-text/zathura-pdf-mupdf
		app-text/zathura-cb"
RDEPEND="${DEPEND}"
BDEPEND=""
