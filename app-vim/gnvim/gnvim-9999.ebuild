# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES=""

inherit cargo xdg-utils

DESCRIPTION="GUI for neovim, without any web bloat"
HOMEPAGE="https://github.com/vhakulinen/gnvim"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vhakulinen/${PN^}.git"
else
	SRC_URI="https://github.com/vhakulinen/${PN^}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

BDEPEND="app-editors/neovim"

DEPEND="${BDEPEND}"
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		default
		cargo_src_unpack
	fi
}

src_compile() {
	export CARGO_HOME="${ECARGO_HOME}"
	emake build FEATURES=""
}

src_install() {
	export CARGO_HOME="${ECARGO_HOME}"
	emake install DESTDIR=${D} PREFIX="/usr"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
