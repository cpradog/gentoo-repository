# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 git-r3

MY_P=podman-compose-${PV}
DESCRIPTION="a script to run docker-compose.yml using podman"
HOMEPAGE="
	https://github.com/containers/podman-compose/
	https://pypi.org/project/podman-compose/
"
EGIT_REPO_URI="https://github.com/containers/podman-compose.git"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-containers/podman
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
