# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Astal GTK4 widget library"
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	gui-libs/gtk4-layer-shell[vala]
	gui-libs/gtk
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/astal/gtk4"

src_prepare() {
	default
	astal_src_prepare
}
