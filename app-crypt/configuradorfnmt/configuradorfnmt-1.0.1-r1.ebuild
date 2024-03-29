# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Spanish government's FNMT cryptographic keys generator"
HOMEPAGE="https://www.sede.fnmt.gob.es"
SRC_URI="https://descargas.cert.fnmt.es/Linux/configuradorfnmt-${PV}-0.x86_64.rpm"

LICENSE="|| ( GPL-2+ EUPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}

src_install() {
	cp -R "${S}/usr" "${D}/" || die "Install failed!"
}
