# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

MY_PV=$(ver_rs 3 '-')

DESCRIPTION="NordVPN native client"
HOMEPAGE="https://nordvpn.com"
SRC_URI="https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_${MY_PV}_amd64.deb"

LICENSE="NordVPN"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="ipsymlink"

# TODO: verify that list of RDEPEND is complete
RDEPEND="net-misc/networkmanager
		net-vpn/networkmanager-openvpn
		sys-apps/iproute2
		acct-group/nordvpn"


RESTRICT="strip"
S="${WORKDIR}"

src_unpack() {
	# Unpack Debian package containing application's files
	unpack_deb ${A}
	gzip "${S}"/usr/share/doc/nordvpn/changelog.gz -d "${S}"
	gzip "${S}"/usr/share/man/man1/nordvpn.1.gz -d "${S}"
}

src_install() {
	cd ${S}

#   doinitd>etc/init.d/nordvpn
	newinitd "${FILESDIR}/nordvpn.initd" ${PN}

#   into<-->/usr
	dobin usr/bin/nordvpn
	dosbin usr/sbin/nordvpnd

	insinto /var/lib/
	doins -r var/lib/nordvpn

	fowners root:nordvpn /var/lib/nordvpn/openvpn
	fperms 0550 /var/lib/nordvpn/openvpn

	insinto /usr/share/bash-completion/completions
	doins usr/share/bash-completion/completions/nordvpn

	dodoc usr/share/doc/nordvpn/changelog
	doman usr/share/man/man1/nordvpn.1

	if use ipsymlink ; then
		dosym /bin/ip /sbin/ip
	fi

	insinto /usr/lib/tmpfiles.d
	doins "${FILESDIR}/nordvpn.conf"
}

pkg_postinst (){
	if use !ipsymlink ; then
		elog "nordvpnd expects to find ip command in /sbin folder iproute2 package installs it in /bin please make sure to create a symlink: ln -s /bin/ip /sbin/ip"
	fi
}
