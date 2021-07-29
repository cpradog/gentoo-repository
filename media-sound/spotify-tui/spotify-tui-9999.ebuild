EAPI=7

inherit cargo git-r3 systemd

DESCRIPTION="A terminal user interface for Spotify"
HOMEPAGE="https://github.com/Rigellute/spotify-tui"
EGIT_REPO_URI="https://github.com/Rigellute/${PN}.git"
RESTRICT="mirror"
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 ISC MIT Unlicense Zlib"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

