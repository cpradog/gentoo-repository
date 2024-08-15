# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig-package

DESCRIPTION="Idiomatic Zig bindings for fcft"
HOMEPAGE="https://git.sr.ht/~novakane/zig-fcft/"
SRC_URI="https://git.sr.ht/~novakane/zig-fcft/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND=">=media-libs/fcft-3.1.8"
