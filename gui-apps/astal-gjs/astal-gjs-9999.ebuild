# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Astral gjs language support"
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	|| ( gui-apps/astal-gtk3 gui-apps/astal-gtk4 )
	dev-libs/gjs
"
RDEPEND="${DEPEND}"

EMESON_SOURCE="${S}/lang/gjs"

src_prepare() {
	astal_src_prepare
}
