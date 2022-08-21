# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LLDB's machine interface driver"
HOMEPAGE="https://lldb.llvm.org"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lldb-tools/${PN}"
else
	SRC_URI="https://github.com/lldb-tools/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

BDEPEND=""
DEPEND="dev-util/lldb"
RDEPEND="${DEPEND}"

src_configure() {
	cmake_src_configure
}
