# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala

DESCRIPTION="Astal GTK4 widget library"
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-lang/vala[valadoc]
	gui-libs/gtk4-layer-shell[vala]
	dev-libs/gobject-introspection
	gui-libs/gtk
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

EMESON_SOURCE="${S}/lib/astal/gtk4"

src_prepare() {
	default
	vala_setup
	export VALADOC="valadoc-$(vala_best_api_version)"
}
