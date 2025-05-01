# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="A hacky debugger UI for hackers"
HOMEPAGE="https://github.com/snare/voltron"
EGIT_REPO_URI="https://github.com/snare/voltron.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/scruffington
	dev-python/flask
	dev-python/flask-restful
	dev-python/blessed
	dev-python/pygments
	dev-python/requests
	dev-python/requests-unixsocket
	dev-python/six
	dev-python/pysigset
"
BDEPEND=""
distutils_enable_tests pytest
