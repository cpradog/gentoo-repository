# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo git-r3

DESCRIPTION="An implementation of Language Server Protocol for the Rust programming language"
HOMEPAGE="https://rust-analyzer.github.io"
EGIT_REPO_URI="https://github.com/rust-analyzer/rust-analyzer"
LICENSE="MIT Apache-2.0"

SLOT="0"
IUSE=""

DEPEND="|| ( dev-lang/rust[rust-src] dev-lang/rust-bin[rust-src] )"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/rust-analyzer"

src_unpack() {
  git-r3_src_unpack
  cargo_live_src_unpack
}

src_test() {
  # Requires out of source git repo.
  cargo_src_test -- --skip "tidy::check_merge_commits"
}

src_install() {
  cargo_src_install --path "./crates/rust-analyzer"
}
