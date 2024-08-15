EAPI=8

ZIG_MIN="0.11"

inherit git-r3 zig-build

DESCRIPTION="A multi-purpose (password-)prompt tool for Wayland"
HOMEPAGE="https://git.sr.ht/~leon_plickat/wayprompt"
EGIT_REPO_URI="https://git.sr.ht/~leon_plickat/wayprompt"

LICENSE="GPL-3"
SLOT="0"

PATCHES=(
	"${FILESDIR}/fix-zig-spoon-hash.patch"
)

DEPEND="
	dev-zig/zig-fcft
	dev-zig/zig-ini
	dev-zig/zig-pixman
	dev-zig/zig-spoon
	dev-zig/zig-wayland
	dev-zig/zig-xkbcommon
"
