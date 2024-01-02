EAPI=8

CRATES="
"

inherit cargo git-r3

DESCRIPTION="High-velocity, monorepo-scale workflow for Git"
HOMEPAGE="https://github.com/arxanas/git-branchless"
EGIT_REPO_URI="https://github.com/arxanas/git-branchless.git"
LICENSE="MIT Apache-2.0"

SLOT="0"
IUSE=""

DEPEND="|| ( dev-lang/rust dev-lang/rust-bin )"
RDEPEND="${DEPEND}"

src_unpack() {
  git-r3_src_unpack
  cargo_live_src_unpack
}

src_install() {
  cargo_src_install --path "./git-branchless"
  cargo_src_install --path "./git-branchless-hook"
  cargo_src_install --path "./git-branchless-init"
  cargo_src_install --path "./git-branchless-query"
  cargo_src_install --path "./git-branchless-record"
  cargo_src_install --path "./git-branchless-smartlog"
  cargo_src_install --path "./git-branchless-submit"
  cargo_src_install --path "./git-branchless-test"
}
