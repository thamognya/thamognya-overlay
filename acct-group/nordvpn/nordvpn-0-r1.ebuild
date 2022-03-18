# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-group

DESCRIPTION="Group for nordvpn"
ACCT_GROUP_ID=509
ACCT_USER_GROUPS=( ${PN} )

acct-user_add_deps
