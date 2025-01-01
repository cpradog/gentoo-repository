# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION=" Scaffolding CLI for Astal+TypeScript "
HOMEPAGE="https://aylur.github.io/ags/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	gui-libs/gtk4-layer-shell
	gui-apps/astal-gjs
	dev-lang/go
"
RDEPEND="${DEPEND}"
BDEPEND="
"
PDEPEND=""

EGIT_REPO_URI="https://github.com/aylur/ags"
case "${PV}" in
	"9999")
		inherit git-r3
		;;
	*)
		SRC_URI="${EGIT_REPO_URI}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
		;;
esac

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -v -ldflags "\
		-X 'main.gtk4LayerShell=$(pkg-config --variable=libdir gtk4-layer-shell-0)/libgtk4-layer-shell.so' \
		-X 'main.astalGjs=$(pkg-config --variable=srcdir astal-gjs)'"
}

src_install() {
	dobin ags
}
