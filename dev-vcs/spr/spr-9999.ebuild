EAPI=8

CRATES="
"

inherit cargo git-r3

DESCRIPTION="Submit pull requests for individual, amendable, rebaseable commits to GitHub"
HOMEPAGE="https://getcord.github.io/spr/"
EGIT_REPO_URI="https://github.com/getcord/spr.git"
LICENSE="MIT"

SLOT="0"
IUSE=""

DEPEND="|| ( dev-lang/rust dev-lang/rust-bin )"
RDEPEND="${DEPEND}"

src_unpack() {
  git-r3_src_unpack
  cargo_live_src_unpack
}

src_install() {
  cargo_src_install --path "./spr"
}
