# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="It's Hacker News in your terminal"
HOMEPAGE="https://github.com/bensadeh/circumflex"

EGIT_REPO_URI="https://github.com/bensadeh/circumflex.git"

RESTRICT="network-sandbox strip"
LICENSE="AGPL-3"
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
	go build -v -ldflags "-s -w" -o clx "main.go"
}

src_install() {
	dobin clx
	doman share/man/clx.1
}
