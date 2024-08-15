# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig-package

SRC_HASH="fdba8e643c9558254bf4e6c600dfbd782fa7a267"
DESCRIPTION="Simple, low-level and allocation free abstraction for creating TUI programs"
HOMEPAGE="https://git.sr.ht/~leon_plickat/zig-spoon"
SRC_URI="https://git.sr.ht/~leon_plickat/zig-spoon/archive/${SRC_HASH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${SRC_HASH}"

LICENSE="MIT"
KEYWORDS="~amd64"
RESTRICT="test"
