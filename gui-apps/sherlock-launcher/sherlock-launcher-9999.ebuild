# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

CRATES=""

inherit cargo git-r3 xdg

DESCRIPTION="Versatile application/command launcher for Wayland built with Rust and GTK4"
HOMEPAGE="https://github.com/Skxxtz/sherlock"
EGIT_REPO_URI="https://github.com/Skxxtz/sherlock.git"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	>=gui-libs/gtk-4.6:4
	gui-libs/gtk4-layer-shell
	dev-libs/openssl:=
	dev-db/sqlite:3
	gnome-base/librsvg:2
	x11-libs/gdk-pixbuf:2
	sys-apps/dbus
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/sherlock"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install

	insinto /usr/share/applications
	newins - sherlock.desktop <<-EOF
		[Desktop Entry]
		Type=Application
		Name=Sherlock Launcher
		Comment=Application launcher for Wayland
		Exec=sherlock
		Icon=sherlock
		Terminal=false
		Categories=Utility;
		Keywords=launcher;runner;search;
	EOF

	einstalldocs
}

pkg_postinst() {
	xdg_pkg_postinst

	elog "Run 'sherlock init' to create the default configuration files"
	elog "in ~/.config/sherlock/"
	elog ""
	elog "For Hyprland, add to your config:"
	elog '  $menu = sherlock'
	elog '  bind = $mainMod, space, exec, $menu'
}
