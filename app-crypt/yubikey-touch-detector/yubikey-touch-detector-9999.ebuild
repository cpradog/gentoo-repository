# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION=" A tool to detect when your YubiKey is waiting for a touch (to send notification or display a visual indicator on the screen) "
HOMEPAGE="https://github.com/maximbaz/yubikey-touch-detector"

EGIT_REPO_URI="https://github.com/maximbaz/yubikey-touch-detector.git"

RESTRICT="network-sandbox strip"
LICENSE="ISC"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"

BDEPEND="
"

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake build
}

src_install() {
	emake install PREFIX="${D}/usr"
}
