# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Audio visualizer using cava."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	media-sound/libcava
"
RDEPEND="${DEPEND}"

EMESON_SOURCE="${S}/lib/cava"

src_prepare() {
	astal_src_prepare
}
