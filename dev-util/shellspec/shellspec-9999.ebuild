# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A full-featured BDD unit testing framework for bash, ksh, zsh, dash and all POSIX shells"
HOMEPAGE="https://shellspec.info/"
EGIT_REPO_URI="https://github.com/shellspec/shellspec.git"
LICENSE="MIT"
SLOT="0"

src_unpack() {
	default
	git-r3_src_unpack
}

src_compile() {
	true
}

src_install() {
	emake install PREFIX=${D}/usr
}
