EAPI=8

inherit systemd git-r3

DESCRIPTION="Bind wallpaper downloader"
HOMEPAGE="https://github.com/cpradog/bwd"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
EGIT_REPO_URI="https://github.com/cpradog/${PN}.git"

IUSE="systemd"
RDEPEND="acct-user/bwd"

PATCHES=(
	"${FILESDIR}/systemd-user.patch"
)

src_install() {
	dobin bwd
	insinto /etc
	doins bwd.conf

	if use systemd; then
		systemd_dounit bwd.service
		systemd_dounit bwd.timer

		sed -i 's|\[Service\]|[Service]\nUser=bwd|' ${D}/$(systemd_get_systemunitdir)/bwd.service
	fi

	keepdir /var/lib/wallpapers
	fowners bwd:wheel /var/lib/wallpapers
}
