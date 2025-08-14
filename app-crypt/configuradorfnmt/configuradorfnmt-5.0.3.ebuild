# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop java-utils-2 rpm xdg

DESCRIPTION="Spanish government certificate request generator"
HOMEPAGE="https://www.cert.fnmt.es/"
SRC_URI="https://descargas.cert.fnmt.es/Linux/${PN}_${PV}.x8664.rpm"

S=${WORKDIR}

LICENSE="FNMT-RCM"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/jre:17"
DEPEND="${RDEPEND}"

src_install() {
	cp -r . "${D}"
}
