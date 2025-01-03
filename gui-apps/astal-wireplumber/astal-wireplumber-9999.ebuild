# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Wrapper library over wireplumber to better integrate with Astal."
HOMEPAGE="https://aylur.github.io/astal/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-apps/astal
	dev-lang/vala[valadoc]
	dev-libs/gobject-introspection
	media-video/wireplumber
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-eselect/eselect-vala
	dev-build/meson
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

EMESON_SOURCE="${S}/lib/wireplumber"
