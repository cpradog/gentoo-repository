# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES=""

# Matches the rust-version field declared in mise's Cargo.toml.
RUST_MIN_VER="1.91.0"

inherit cargo git-r3 shell-completion

DESCRIPTION="The front-end to your dev env"
HOMEPAGE="https://mise.jdx.dev"
EGIT_REPO_URI="https://github.com/jdx/mise.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
PROPERTIES="live"
IUSE="bash-completion fish-completion zsh-completion"

# mise links the system OpenSSL via the native-tls crate.
DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}"
# Appended to the Rust dependency the cargo eclass already placed in BDEPEND.
BDEPEND+=" virtual/pkgconfig"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install

	doman man/man1/mise.1

	# mise ships a built-in self-update command. Replace it with instructions
	# to use Portage, since the package is managed by this overlay.
	insinto /usr/lib/mise
	doins "${FILESDIR}"/mise-self-update-instructions.toml

	# Enable paranoid mode system-wide.
	insinto /etc/mise
	doins "${FILESDIR}"/config.toml

	# Auto-enable mise for Bash and Zsh.
	insinto /etc/profile.d
	doins "${FILESDIR}"/mise.sh

	# Auto-enable mise for Fish.
	insinto /usr/share/fish/vendor_conf.d
	doins "${FILESDIR}"/mise.fish

	# Static shell completions. mise also serves completions dynamically once
	# activated (see /etc/profile.d/mise.sh and the Fish conf installed above).
	if use bash-completion; then
		newbashcomp completions/mise.bash mise
	fi
	if use zsh-completion; then
		newzshcomp completions/_mise _mise
	fi
	if use fish-completion; then
		newfishcomp completions/mise.fish mise.fish
	fi
}
