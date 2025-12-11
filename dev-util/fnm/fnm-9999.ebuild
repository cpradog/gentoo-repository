# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES=""

inherit cargo git-r3 shell-completion

DESCRIPTION="Fast and simple Node.js version manager, built in Rust"
HOMEPAGE="https://github.com/Schniz/fnm"
EGIT_REPO_URI="https://github.com/Schniz/fnm.git"

LICENSE="GPL-3"
SLOT="0"

BDEPEND="|| ( dev-lang/rust dev-lang/rust-bin )"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install

	local shell
	for shell in bash zsh fish; do
		"${ED}/usr/bin/fnm" completions --shell ${shell} > fnm.${shell} || die
	done

	newbashcomp fnm.bash fnm
	newzshcomp fnm.zsh _fnm
	newfishcomp fnm.fish fnm.fish

	dodoc README.md
}

pkg_postinst() {
	elog "To initialize fnm in your shell, add to your config:"
	elog "  eval \"\$(fnm env --use-on-cd)\""
}
