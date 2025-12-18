# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala

DESCRIPTION="Application menu module for GTK translator"
HOMEPAGE="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
SRC_URI="https://gitlab.com/vala-panel-project/vala-panel-appmenu/-/archive/24.05/vala-panel-appmenu-${PV}.tar.gz"
S="${WORKDIR}"/vala-panel-appmenu-${PV}

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/glib[dbus]
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	$(vala_depend)
"

EMESON_SOURCE="${S}/subprojects/appmenu-glib-translator"

src_prepare() {
	default
	vala_setup
}
