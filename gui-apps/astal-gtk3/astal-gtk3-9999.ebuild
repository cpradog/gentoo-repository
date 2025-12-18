# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Astal GTK3 widget library"
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	gui-libs/gtk-layer-shell[vala]
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/astal/gtk3"

src_prepare() {
	default
	astal_src_prepare
}
