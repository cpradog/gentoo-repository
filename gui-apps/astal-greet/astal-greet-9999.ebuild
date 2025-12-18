# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Library and CLI tool for sending requests to greetd."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-libs/json-glib[introspection]
	gui-libs/greetd
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/greet"

src_prepare() {
	default
	astal_src_prepare
}
