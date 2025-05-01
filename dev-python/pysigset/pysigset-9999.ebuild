# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="Python blocking/suspending signals under Linux/OSX using ctypes sigprocmask access"
HOMEPAGE="https://github.com/ossobv/pysigset"
EGIT_REPO_URI="https://github.com/ossobv/pysigset.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""
distutils_enable_tests pytest
