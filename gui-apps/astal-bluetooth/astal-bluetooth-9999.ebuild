# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit astal

DESCRIPTION="Library for monitoring bluez over dbus."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	net-wireless/bluez
"
RDEPEND="${DEPEND}"


EMESON_SOURCE="${S}/lib/bluetooth"

src_prepare() {
	default
	astal_src_prepare
}
