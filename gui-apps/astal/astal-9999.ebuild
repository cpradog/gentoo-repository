# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Building blocks for creating custom desktop shells"
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+gtk3 +gtk4 +apps +auth +battery +bluetooth cava greetd hyprland +mpris +network +notifd +powerprofiles river +tray +wireplumber"

DEPEND="
	dev-lang/vala[valadoc]
	dev-libs/gobject-introspection
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-eselect/eselect-vala
	dev-build/meson
"
PDEPEND="
	gtk3? ( gui-apps/astal-gtk3 )
	gtk4? ( gui-apps/astal-gtk4 )
	apps? ( gui-apps/astal-apps )
	auth? ( gui-apps/astal-auth )
	battery? ( gui-apps/astal-battery )
	bluetooth? ( gui-apps/astal-bluetooth )
	cava? ( gui-apps/astal-cava )
	greetd? ( gui-apps/astal-greet )
	hyprland? ( gui-apps/astal-hyprland )
	mpris? ( gui-apps/astal-mpris )
	network? ( gui-apps/astal-network )
	notifd? ( gui-apps/astal-notifd )
	powerprofiles? ( gui-apps/astal-powerprofiles )
	river? ( gui-apps/astal-river )
	tray? ( gui-apps/astal-tray )
	wireplumber? ( gui-apps/astal-wireplumber )
"

EGIT_REPO_URI="https://github.com/aylur/astal"
case "${PV}" in
	"9999")
		inherit git-r3
		;;
	*)
		SRC_URI="${EGIT_REPO_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
		;;
esac

EMESON_SOURCE="${S}/lib/astal/io"
