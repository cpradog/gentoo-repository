# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop java-utils-2 rpm xdg

DESCRIPTION="Spanish government certificate request generator"
HOMEPAGE="https://www.cert.fnmt.es/"
SRC_URI="https://descargas.cert.fnmt.es/Linux/${P}-0.x86_64.rpm"

S=${WORKDIR}

LICENSE="FNMT-RCM"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/jre:17"
DEPEND="${RDEPEND}"

src_install() {
	cp -r . "${D}"
}
