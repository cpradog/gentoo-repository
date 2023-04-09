# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors."
HOMEPAGE="https://github.com/Alexays/Waybar"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Alexays/${PN^}.git"
else
	SRC_URI="https://github.com/Alexays/${PN^}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="experimental gtk-layer-shell jack libcxx libinput logind man-pages mpd mpris network pulseaudio rfkill sndio systemd tray udev upower wireplumber"

BDEPEND="
	>=app-text/scdoc-1.9.2
	virtual/pkgconfig
	dev-cpp/gtkmm:3.0
	dev-libs/jsoncpp:=
	dev-libs/libinput:=
	dev-libs/libsigc++:2
	>=dev-libs/libfmt-5.3.0:=
	>=dev-libs/spdlog-1.3.1:=
	dev-libs/date[tz,system_tz]
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wlroots
	gtk-layer-shell? ( gui-libs/gtk-layer-shell )
	mpd? ( media-libs/libmpdclient )
	network? ( dev-libs/libnl:3 )
	pulseaudio? ( media-sound/pulseaudio )
	tray? (
			dev-libs/libdbusmenu[gtk3]
			dev-libs/libappindicator
		  )
	udev? ( virtual/libudev:= )
	"

DEPEND="${BDEPEND}"
RDEPEND="${DEPEND}"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${PN^}-${PV}"
fi

src_configure() {
	local emesonargs=(
		$(meson_boolean experimental)
		$(meson_feature gtk-layer-shell)
		$(meson_feature jack)
		$(meson_boolean libcxx)
		$(meson_feature libinput)
		$(meson_feature logind)
		$(meson_feature man-pages)
		$(meson_feature mpd)
		$(meson_feature mpris)
		$(meson_feature network libnl)
		$(meson_feature pulseaudio)
		$(meson_feature rfkill)
		$(meson_feature sndio)
		$(meson_feature systemd)
		$(meson_feature tray dbusmenu-gtk)
		$(meson_feature upower upower_glib)
		$(meson_feature udev libudev)
		$(meson_feature wireplumber)
	)
	meson_src_configure
}
