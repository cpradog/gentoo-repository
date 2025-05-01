# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="Scruffy. The Janitor."
HOMEPAGE="https://github.com/snare/scruffy"
EGIT_REPO_URI="https://github.com/snare/scruffy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""
distutils_enable_tests pytest
