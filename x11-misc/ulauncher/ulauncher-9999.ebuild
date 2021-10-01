# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)

inherit desktop distutils-r1

DESCRIPTION="Application launcher for Linux"
HOMEPAGE="https://ulauncher.io"

if [[ ${PV} == 9999 ]]; then
  inherit git-r3
  SRC_URI=""
  KEYWORDS=""
  EGIT_REPO_URI="https://github.com/Ulauncher/${PN^}.git"
else
  SRC_URI="https://github.com/Ulauncher/${PN^}/releases/download/${PV}/${PN}_${PV}.tar.gz"
  KEYWORDS="~amd64 ~x86"
  S="${WORKDIR}/${PN}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="-X"

PYTHON_REQ_USE="sqlite"

DEPEND="
  dev-python/python-distutils-extra[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
  dev-python/dbus-python[${PYTHON_USEDEP}]
  dev-python/pygobject:3[${PYTHON_USEDEP}]
  dev-python/pyinotify[${PYTHON_USEDEP}]
  dev-python/python-levenshtein[${PYTHON_USEDEP}]
  dev-python/pyxdg[${PYTHON_USEDEP}]
  dev-python/websocket-client[${PYTHON_USEDEP}]
  dev-libs/gobject-introspection:=
  dev-libs/libappindicator:3
  x11-libs/libnotify
  X? ( dev-libs/keybinder:3 )
  net-libs/webkit-gtk:4/37
"

BDEPEND="
  ${PYTHON_DEPS}
"

PATCHES=(
  ${FILESDIR}/no-keybinder-on-wayland.patch
  ${FILESDIR}/remove-gdkx11-dependency.patch
)

build_preferences() {
  cd ${WORKDIR}/${P}/data/preferences
  source /home/cpradog/.local/share/nvm/nvm.sh
  yarn install
  yarn run build
}

src_unpack() {
  git-r3_src_unpack
  build_preferences
}

src_install() {
  distutils-r1_src_install
  domenu build/share/applications/${PN}.desktop
}
