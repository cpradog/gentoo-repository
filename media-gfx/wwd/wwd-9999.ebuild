EAPI=8

inherit systemd git-r3

DESCRIPTION="Wallhaven wallpaper downloader"
HOMEPAGE="https://github.com/cpradog/wwd"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
