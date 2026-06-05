# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd git-r3

DESCRIPTION="Wallhaven wallpaper downloader"
HOMEPAGE="https://github.com/cpradog/wwd"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
EGIT_REPO_URI="https://github.com/cpradog/${PN}.git"

IUSE="systemd"
RDEPEND="acct-user/wallpapers"

PATCHES=(
	"${FILESDIR}/systemd-user.patch"
)

src_install() {
	dobin wwd
	insinto /etc
	doins wwd.conf

	if use systemd; then
		systemd_dounit wwd.service
		systemd_dounit wwd.timer
	fi

	keepdir /var/lib/wallpapers
	fowners wallpapers:wheel /var/lib/wallpapers
}
