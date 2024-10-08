# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig-package

SRC_HASH="879c74a3a801d49fa34343aebd55a22f591899b3"
DESCRIPTION="Simple tokenizer for the .ini format"
HOMEPAGE="https://git.sr.ht/~leon_plickat/zig-ini"
SRC_URI="https://git.sr.ht/~leon_plickat/zig-ini/archive/${SRC_HASH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${SRC_HASH}"

LICENSE="MIT"
KEYWORDS="~amd64"
RESTRICT="test"
