EAPI=8

ZIG_MIN="0.11"

inherit git-r3 zig-build

DESCRIPTION="A multi-purpose (password-)prompt tool for Wayland"
HOMEPAGE="https://git.sr.ht/~leon_plickat/wayprompt"
EGIT_REPO_URI="https://git.sr.ht/~leon_plickat/wayprompt"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/wayland
	x11-libs/libxkbcommon
	x11-libs/pixman
	media-libs/fcft
"
