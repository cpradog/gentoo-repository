# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11,12} )

inherit meson python-r1

DESCRIPTION="Systemd integration for Sway session"
HOMEPAGE="https://github.com/alebastr/sway-systemd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EGIT_REPO_URI="https://github.com/alebastr/${PN}"
case "${PV}" in
	"9999")
	inherit git-r3
	;;
	*)
	SRC_URI="${EGIT_REPO_URI}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac
inherit meson

DEPEND="
	dev-python/dbus-next[${PYTHON_USEDEP}]
	dev-python/i3ipc[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/python-xlib[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		-Dautoload-configs=all
	)

	meson_src_configure
}
