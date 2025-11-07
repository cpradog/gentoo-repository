# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala

DESCRIPTION="Library for managing the systemtray by implementing the StatusNotifierItem protocol."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-lang/vala[valadoc]
	dev-libs/gobject-introspection
	dev-libs/json-glib[introspection]
	x11-libs/gtk+:3
	dev-libs/libdbusmenu[introspection,gtk3]
	x11-misc/appmenu-gtk-module
	x11-misc/appmenu-glib-translator
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-eselect/eselect-vala
	dev-build/meson
"

EGIT_REPO_URI="https://github.com/aylur/astal"
case "${PV}" in
"9999")
	inherit git-r3
	;;
*)
	SRC_URI="${EGIT_REPO_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac

EMESON_SOURCE="${S}/lib/tray"

src_prepare() {
	default
	vala_setup
	export VALADOC="valadoc-$(vala_best_api_version)"
}
