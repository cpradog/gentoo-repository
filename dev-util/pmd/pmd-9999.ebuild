# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="An extensible multilanguage static code analyzer."
HOMEPAGE="https://pmd.github.io/"
EGIT_REPO_URI="https://github.com/pmd/pmd.git"
LICENSE="BSD Apache-2.0"

SLOT="0"
IUSE=""

DEPEND="
	>=virtual/jdk-1.11:*
	dev-java/maven-bin
"
RDEPEND="${DEPEND}"

MAVEN_SETTINGS="${WORKDIR}/settings.xml"

src_unpack() {
  git-r3_fetch
  git-r3_checkout
  echo "<settings><localRepository>${WORKDIR}/.m2</localRepository></settings>" > "${MAVEN_SETTINGS}"
  cd "${S}"
  mvn -s "${MAVEN_SETTINGS}" package -DskipTests
}

src_install() {
  DIST_FILE=$(find "${S}/pmd-dist/target" -name 'pmd-bin-*.zip')
  DIST_BASENAME=$(basename "${DIST_FILE}" .zip)
  cd "${WORKDIR}"
  unzip -XK "${DIST_FILE}"
  mkdir -p "${D}/usr/share/${PN}"
  mv "${DIST_BASENAME}"/* "${D}/usr/share/${PN}"

  dosym "/usr/share/${PN}/bin/pmd" /usr/bin/pmd
}
