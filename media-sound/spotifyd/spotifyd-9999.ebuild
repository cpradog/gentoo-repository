# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=7

EGIT_REPO_URI="https://github.com/Spotifyd/${PN}.git"
CRATES="
addr2line-0.17.0
adler-1.0.2
aes-0.6.0
aes-ctr-0.6.0
aes-soft-0.6.4
aesni-0.10.0
aho-corasick-0.7.18
alsa-0.5.0
alsa-sys-0.3.1
ansi_term-0.12.1
async-trait-0.1.53
atty-0.2.14
autocfg-1.1.0
backtrace-0.3.65
base64-0.13.0
bitflags-1.3.2
block-buffer-0.9.0
boxfnonce-0.1.1
bumpalo-3.9.1
byteorder-1.4.3
bytes-0.4.12
bytes-0.5.6
bytes-1.1.0
cc-1.0.73
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
cipher-0.2.5
clap-2.34.0
cloudabi-0.0.3
color-eyre-0.5.11
color-spantrace-0.1.6
core-foundation-0.9.3
core-foundation-sys-0.8.3
cpufeatures-0.2.2
crossbeam-utils-0.7.2
crypto-mac-0.11.1
ctr-0.6.0
daemonize-0.4.1
digest-0.9.0
dirs-4.0.0
dirs-sys-0.3.7
encoding_rs-0.8.31
env_logger-0.7.1
error-chain-0.11.0
eyre-0.6.8
fastrand-1.7.0
fern-0.6.1
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.31
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-executor-0.3.21
futures-io-0.3.21
futures-macro-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
gcc-0.3.55
generic-array-0.14.5
gethostname-0.2.3
getrandom-0.2.6
gimli-0.26.1
glob-0.3.0
h2-0.3.13
hashbrown-0.11.2
heck-0.3.3
hermit-abi-0.1.19
hex-0.4.3
hmac-0.11.0
hostname-0.3.1
http-0.2.7
http-body-0.4.5
httparse-1.7.1
httpdate-1.0.2
humantime-1.3.0
hyper-0.14.19
hyper-tls-0.5.0
idna-0.1.5
idna-0.2.3
if-addrs-0.6.7
if-addrs-sys-0.3.2
indenter-0.3.3
indexmap-1.8.2
instant-0.1.12
iovec-0.1.4
ipnet-2.5.0
itoa-1.0.2
js-sys-0.3.57
kernel32-sys-0.2.2
lazy_static-1.4.0
lewton-0.10.2
libc-0.2.126
libmdns-0.6.2
librespot-audio-0.2.0
librespot-connect-0.2.0
librespot-core-0.2.0
librespot-metadata-0.2.0
librespot-playback-0.2.0
librespot-protocol-0.2.0
librespot-tremor-0.2.0
lock_api-0.3.4
log-0.4.17
match_cfg-0.1.0
matches-0.1.9
maybe-uninit-2.0.0
memchr-2.5.0
mime-0.3.16
miniz_oxide-0.5.1
mio-0.6.23
mio-0.8.3
miow-0.2.2
multimap-0.8.3
native-tls-0.2.10
net2-0.2.37
nix-0.20.0
num-bigint-0.4.3
num-integer-0.1.45
num-traits-0.2.15
num_cpus-1.13.1
object-0.28.4
ogg-0.8.0
ogg-sys-0.0.9
once_cell-1.12.0
opaque-debug-0.3.0
openssl-0.10.40
openssl-macros-0.1.0
openssl-probe-0.1.5
openssl-sys-0.9.73
owo-colors-1.3.0
parking_lot-0.9.0
parking_lot_core-0.6.2
pbkdf2-0.8.0
percent-encoding-1.0.1
percent-encoding-2.1.0
pin-project-lite-0.1.12
pin-project-lite-0.2.9
pin-utils-0.1.0
pkg-config-0.3.25
ppv-lite86-0.2.16
priority-queue-1.2.2
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.39
protobuf-2.14.0
protobuf-codegen-2.14.0
protobuf-codegen-pure-2.14.0
quick-error-1.2.3
quote-1.0.18
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.3
redox_syscall-0.1.57
redox_syscall-0.2.13
redox_users-0.4.3
regex-1.5.6
regex-syntax-0.6.26
remove_dir_all-0.5.3
reqwest-0.11.10
rustc-demangle-0.1.21
rustc_version-0.2.3
rustc_version-0.4.0
ryu-1.0.10
schannel-0.1.20
scopeguard-1.1.0
security-framework-2.6.1
security-framework-sys-2.6.1
semver-0.9.0
semver-1.0.9
semver-parser-0.7.0
serde-1.0.137
serde_derive-1.0.137
serde_json-1.0.81
serde_urlencoded-0.7.1
sha-1-0.9.8
shannon-0.2.0
sharded-slab-0.1.4
shell-words-1.1.0
signal-hook-registry-1.4.0
slab-0.4.6
smallvec-0.6.14
socket2-0.4.4
strsim-0.8.0
structopt-0.3.26
structopt-derive-0.4.18
subtle-2.4.1
syn-1.0.95
synstructure-0.12.6
syslog-4.0.1
tempfile-3.3.0
termcolor-1.1.3
textwrap-0.11.0
thiserror-1.0.31
thiserror-impl-1.0.31
thread_local-1.1.4
time-0.1.44
tinyvec-1.6.0
tinyvec_macros-0.1.0
tokio-0.2.25
tokio-1.18.2
tokio-compat-0.1.6
tokio-compat-02-0.2.0
tokio-current-thread-0.1.7
tokio-executor-0.1.10
tokio-io-0.1.13
tokio-macros-1.7.0
tokio-native-tls-0.3.0
tokio-reactor-0.1.12
tokio-stream-0.1.8
tokio-sync-0.1.8
tokio-timer-0.2.13
tokio-util-0.6.10
tokio-util-0.7.2
toml-0.5.9
tower-service-0.3.1
tracing-0.1.34
tracing-attributes-0.1.21
tracing-core-0.1.26
tracing-error-0.1.2
tracing-subscriber-0.2.25
try-lock-0.2.3
typenum-1.15.0
unicode-bidi-0.3.8
unicode-ident-1.0.0
unicode-normalization-0.1.19
unicode-segmentation-1.9.0
unicode-width-0.1.9
unicode-xid-0.2.3
url-1.7.2
url-2.2.2
uuid-0.8.2
valuable-0.1.0
vcpkg-0.2.15
vec_map-0.8.2
vergen-3.2.0
version_check-0.9.4
want-0.3.0
wasi-0.10.0+wasi-snapshot-preview1
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.80
wasm-bindgen-backend-0.2.80
wasm-bindgen-futures-0.4.30
wasm-bindgen-macro-0.2.80
wasm-bindgen-macro-support-0.2.80
wasm-bindgen-shared-0.2.80
web-sys-0.3.57
whoami-0.9.0
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows_aarch64_msvc-0.36.1
windows_i686_gnu-0.36.1
windows_i686_msvc-0.36.1
windows_x86_64_gnu-0.36.1
windows_x86_64_msvc-0.36.1
winreg-0.10.1
ws2_32-sys-0.2.1
xdg-2.4.1
zerocopy-0.3.0
zerocopy-derive-0.2.0
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
  cargo_src_unpack
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
