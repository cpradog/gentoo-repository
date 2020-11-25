# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An incremental parsing system for programming tools"
HOMEPAGE="https://tree-sitter.github.io/"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tree-sitter/${PN}"
else
	SRC_URI="https://github.com/tree-sitter/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""
RESTRICT=""

BDEPEND=""
DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX=${ED}/usr install
}
