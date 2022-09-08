# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=7

EGIT_REPO_URI="https://github.com/Spotifyd/${PN}.git"
CRATES="
"

inherit cargo git-r3 systemd

DESCRIPTION="A spotify daemon"
HOMEPAGE="https://github.com/Spotifyd/spotifyd"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 BSD BSD-2 GPL-3 ISC MIT MPL-2.0 ZLIB"
KEYWORDS=""
SLOT="0"
IUSE="+alsa dbus portaudio pulseaudio rodio"
REQUIRED_USE="|| ( alsa portaudio pulseaudio rodio ) rodio? ( alsa )"

RDEPEND="dev-libs/openssl:0=
	alsa? ( media-libs/alsa-lib )
	dbus? ( sys-apps/dbus )
	portaudio? ( media-libs/portaudio )
	pulseaudio? ( media-sound/pulseaudio )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=({CHANGELOG,README}.md)

QA_FLAGS_IGNORED="usr/bin/spotifyd"

src_unpack() {
  git-r3_src_unpack
  cargo_live_src_unpack
}

src_configure() {
  myfeatures=(
    "$(usex alsa alsa_backend '')"
    "$(usex dbus "dbus_keyring dbus_mpris" '')"
    "$(usex portaudio portaudio_backend '')"
    "$(usex pulseaudio pulseaudio_backend '')"
    "$(usex rodio rodio_backend '')"
  )
}

src_install() {
  einstalldocs
  systemd_douserunit contrib/spotifyd.service
  newinitd "${FILESDIR}"/spotifyd.initd spotifyd
  newconfd "${FILESDIR}"/spotifyd.confd spotifyd
  insinto /etc
  doins "${FILESDIR}"/spotifyd.conf

  cargo_src_install ${myfeatures:+--features "${myfeatures[*]}"} --no-default-features
}
