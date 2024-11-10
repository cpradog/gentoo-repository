# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


DESCRIPTION=" Tool to create Chromium/Chrome/Firefox/Vivaldi SSBs in Peppermint OS. "
HOMEPAGE="https://github.com/peppermintos/ice"
SLOT="0"
KEYWORDS="~amd64"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/peppermintos/${PN^}.git"
else
	SRC_URI="https://github.com/peppermintos/${PN^}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
		git-r3_src_unpack
	else
		default
	fi
}

src_configure() {
	true
}

src_install() {
	cp -r ${WORKDIR}/${P}/usr ${D}/usr
}
