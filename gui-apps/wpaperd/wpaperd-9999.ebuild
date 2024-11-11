# Copyright 2017-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES=""

inherit cargo

DESCRIPTION="wpaperd"
HOMEPAGE="Wallpaper daemon for Wayland"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE="+man"
SLOT="0"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/danyspin97/${PN^}.git"
else
	SRC_URI="$(cargo_crate_uris ${CRATES})"
	SRC_URI="https://github.com/danyspin97/${PN^}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

DEPEND="
	x11-libs/libxkbcommon
"
BDEPEND="
	virtual/pkgconfig
	man? ( app-text/scdoc )
"

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		default
		cargo_src_unpack
	fi
}

src_compile() {
	cargo_src_compile

	if use man; then
		scdoc < man/wpaperd-output.5.scd > man/wpaperd-output.5
	fi
}

src_install() {
	if use man; then
		doman man/wpaperd-output.5
	fi

	cargo_src_install --path daemon
	cargo_src_install --path cli
}
