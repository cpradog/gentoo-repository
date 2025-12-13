# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo git-r3 shell-completion

DESCRIPTION="An Answer to your Wayland Wallpaper Woes - animated wallpaper daemon"
HOMEPAGE="https://codeberg.org/LGFae/awww"
EGIT_REPO_URI="https://codeberg.org/LGFae/awww.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="+man"

DEPEND="
	app-arch/lz4:=
	dev-libs/wayland
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/wayland-scanner
	man? ( app-text/scdoc )
"

QA_FLAGS_IGNORED="usr/bin/awww usr/bin/awww-daemon"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile

	if use man; then
		./doc/gen.sh || die "Failed to generate man pages"
	fi
}

src_install() {
	cargo_src_install --path client
	cargo_src_install --path daemon

	# Shell completions - handle different possible naming schemes
	if [[ -d completions ]]; then
		local bashcomp zshcomp fishcomp

		bashcomp=$(find completions -maxdepth 1 -name "*.bash" -o -name "awww.bash" 2>/dev/null | head -1)
		[[ -f ${bashcomp} ]] && newbashcomp "${bashcomp}" awww

		zshcomp=$(find completions -maxdepth 1 -name "_awww" -o -name "awww.zsh" 2>/dev/null | head -1)
		[[ -f ${zshcomp} ]] && newzshcomp "${zshcomp}" _awww

		fishcomp=$(find completions -maxdepth 1 -name "*.fish" -o -name "awww.fish" 2>/dev/null | head -1)
		[[ -f ${fishcomp} ]] && newfishcomp "${fishcomp}" awww.fish
	fi

	# Man pages
	if use man && [[ -d doc/generated ]]; then
		doman doc/generated/*.1
	fi

	einstalldocs
}

pkg_postinst() {
	elog "To use awww, first start the daemon:"
	elog "  awww-daemon &"
	elog ""
	elog "Then set a wallpaper:"
	elog "  awww img /path/to/image.png"
	elog ""
	elog "For slideshow functionality, see the example scripts at:"
	elog "  https://codeberg.org/LGFae/awww/src/branch/main/example_scripts"
	elog ""
	elog "Note: awww was formerly known as swww. The project was renamed"
	elog "and moved to Codeberg in October 2025."
}
