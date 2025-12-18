# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="A notification daemon implementation as a library and CLI tool."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-libs/json-glib[introspection]
	x11-libs/gdk-pixbuf[introspection]
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/notifd"

src_prepare() {
	default
	astal_src_prepare
}
