# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A git credential helper interfacing with pass, the standard unix password manager."
HOMEPAGE="https://github.com/languitar/pass-git-helper"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/languitar/${PN}"
else
	SRC_URI="https://github.com/languitar/pass-git-helper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P}"
fi

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
