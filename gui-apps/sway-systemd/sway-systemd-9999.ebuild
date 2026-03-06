# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11,12,13,14} )

inherit python-single-r1 meson

DESCRIPTION="Systemd integration for Sway session"
HOMEPAGE="https://github.com/alebastr/sway-systemd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

EGIT_REPO_URI="https://github.com/alebastr/${PN}"
case "${PV}" in
	"9999")
	inherit git-r3
	;;
	*)
	SRC_URI="${EGIT_REPO_URI}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/dbus-fast[${PYTHON_USEDEP}]
		dev-python/i3ipc[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
	')
"

src_configure() {
	local emesonargs=(
		-Dautoload-configs=all
	)

	meson_src_configure
}
