# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Reformats Java source code to comply with Google Java Style."
HOMEPAGE="https://github.com/google/google-java-format"
EGIT_REPO_URI="https://github.com/google/google-java-format.git"
LICENSE="Apache-2.0"

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
  mkdir -p "${D}/usr/bin"
  mv core/target/google-java-format-HEAD-SNAPSHOT-all-deps.jar "${D}/usr/bin/${PN}.jar"
  cat <<EOF > "${D}/usr/bin/${PN}"
#!/bin/sh
java -jar /usr/bin/${PN}.jar $@
EOF
  chmod +x "${D}/usr/bin/${PN}"
}
