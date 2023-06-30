# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} )

inherit systemd autotools eutils xdg-utils python-r1

DESCRIPTION="A screen color temperature adjusting software"
HOMEPAGE="https://gitlab.com/chinstrap/gammastep/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/chinstrap/gammastep.git"
else
	SRC_URI="https://gitlab.com/chinstrap/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}/${PN}-v${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="apparmor drm +geoclue +gui nls randr +systemd vidmode wayland"

BDEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	nls? ( sys-devel/gettext )
"
DEPEND="
	randr? ( >=x11-libs/libX11-1.4 x11-libs/libXxf86vm )
	x11-libs/libxcb
	drm? ( x11-libs/libdrm )
	geoclue? ( app-misc/geoclue:2.0 dev-libs/glib:2 )
	gui? ( dev-libs/libappindicator:3[introspection] ${PYTHON_DEPS} )
	wayland? ( >=dev-libs/wayland-1.15.0 )"
RDEPEND="${DEPEND}
	gui? ( dev-python/pygobject[${PYTHON_USEDEP}]
		x11-libs/gtk+:3[introspection]
		dev-python/pyxdg[${PYTHON_USEDEP}] )"
REQUIRED_USE="gui? ( ${PYTHON_REQUIRED_USE} )"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	use gui && python_setup

	econf \
		$(use_enable nls) \
		$(use_enable drm) \
		$(use_enable randr) \
		$(use_enable vidmode) \
		$(use_enable geoclue geoclue2) \
		$(use_enable gui) \
		$(use_enable wayland) \
		$(use_enable systemd) \
		$(use_enable apparmor) \
		--with-systemduserunitdir="$(systemd_get_userunitdir)"
}

_impl_specific_src_install() {
	emake DESTDIR="${D}" pythondir="$(python_get_sitedir)" \
			-C src/gammastep_indicator install
}

src_install() {
	emake DESTDIR="${D}" UPDATE_ICON_CACHE=/bin/true install

	if use gui; then
		python_foreach_impl _impl_specific_src_install
		python_replicate_script "${D}"/usr/bin/gammastep-indicator

		python_foreach_impl python_optimize
	fi
}

pkg_postinst() {
	use gui && xdg_icon_cache_update
}

pkg_postrm() {
	use gui && xdg_icon_cache_update
}