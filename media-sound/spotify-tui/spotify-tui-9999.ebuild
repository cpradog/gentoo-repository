EAPI=7

inherit cargo git-r3 systemd

DESCRIPTION="A terminal user interface for Spotify"
HOMEPAGE="https://github.com/Rigellute/spotify-tui"
EGIT_REPO_URI="https://github.com/Rigellute/${PN}.git"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

