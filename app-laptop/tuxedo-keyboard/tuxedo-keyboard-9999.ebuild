# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
CONFIG_CHECK="ACPI_WMI INPUT_SPARSEKMAP"

inherit linux-mod toolchain-funcs

DESCRIPTION="Kernel Module for Tuxedo Keyboard"
HOMEPAGE="https://github.com/tuxedocomputers/tuxedo-keyboard"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tuxedocomputers/tuxedo-keyboard.git"
else
	SRC_URI="https://github.com/tuxedocomputers/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BUILD_TARGETS="all"
MODULE_NAMES="clevo_acpi(tuxedo:${S}:src) clevo_wmi(tuxedo:${S}:src) uniwill_wmi(tuxedo:${S}:src) tuxedo_keyboard(tuxedo:${S}:src) tuxedo_io(tuxedo:${S}:src/tuxedo_io)"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="CC=$(tc-getBUILD_CC) KDIR=${KV_DIR} V=1 KBUILD_VERBOSE=1"
}
