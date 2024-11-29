# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="A git credential helper interfacing with pass, the standard unix password manager."
HOMEPAGE="https://github.com/languitar/pass-git-helper"
SRC_URI="https://github.com/languitar/pass-git-helper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

