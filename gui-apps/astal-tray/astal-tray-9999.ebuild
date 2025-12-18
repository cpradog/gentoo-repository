# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Library for managing the systemtray by implementing the StatusNotifierItem protocol."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-libs/json-glib[introspection]
	x11-libs/gtk+:3
	dev-libs/libdbusmenu[introspection,gtk3]
	x11-misc/appmenu-gtk-module
	x11-misc/appmenu-glib-translator
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/tray"

src_prepare() {
	default
	astal_src_prepare
}
