# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A package manager for the Zig programming language."
HOMEPAGE="https://github.com/nektro/zigmod"

SRC_URI="https://github.com/nektro/zigmod/releases/download/r${PV}/zigmod-x86_64-linux -> zigmod"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/zigmod"

src_unpack() {
	mkdir -p "${S}"
	cp "${DISTDIR}/zigmod" "${S}"
}

src_install() {
	dobin zigmod
}
