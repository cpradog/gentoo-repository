# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=7

EGIT_REPO_URI="https://github.com/Spotifyd/${PN}.git"
CRATES="
addr2line-0.14.1
adler-0.2.3
aes-0.6.0
aes-ctr-0.6.0
aes-soft-0.6.4
aesni-0.10.0
aho-corasick-0.7.6
alsa-0.5.0
alsa-sys-0.3.1
ansi_term-0.11.0
async-trait-0.1.50
atty-0.2.14
autocfg-0.1.7
autocfg-1.0.0
backtrace-0.3.55
base64-0.10.1
base64-0.11.0
base64-0.13.0
bitflags-1.2.1
block-buffer-0.9.0
boxfnonce-0.1.1
bumpalo-3.2.0
byteorder-1.4.3
bytes-0.4.12
bytes-0.5.6
bytes-1.0.1
c2-chacha-0.2.3
cc-1.0.50
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.11
cipher-0.2.5
clap-2.33.0
cloudabi-0.0.3
color-eyre-0.5.10
color-spantrace-0.1.6
core-foundation-0.9.1
core-foundation-sys-0.8.2
cpuid-bool-0.1.2
crossbeam-utils-0.6.6
crypto-mac-0.11.0
ctr-0.6.0
daemonize-0.4.1
darling-0.9.0
darling_core-0.9.0
darling_macro-0.9.0
derefable-0.1.0
derive_builder-0.7.2
derive_builder_core-0.5.0
digest-0.9.0
dotenv-0.13.0
dtoa-0.4.4
either-1.5.3
encoding_rs-0.8.22
env_logger-0.6.2
env_logger-0.7.1
error-chain-0.11.0
eyre-0.6.5
failure-0.1.7
failure_derive-0.1.7
fern-0.6.0
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-0.3.15
futures-channel-0.3.15
futures-core-0.3.15
futures-executor-0.3.15
futures-io-0.3.15
futures-macro-0.3.15
futures-sink-0.3.15
futures-task-0.3.15
futures-util-0.3.15
gcc-0.3.55
generic-array-0.14.4
gethostname-0.2.1
getrandom-0.1.14
getrandom-0.2.3
gimli-0.23.0
glob-0.3.0
h2-0.2.1
h2-0.3.3
hashbrown-0.11.2
heck-0.3.1
hermit-abi-0.1.6
hex-0.4.2
hmac-0.11.0
hostname-0.3.1
http-0.2.0
http-body-0.3.1
http-body-0.4.2
httparse-1.3.4
httpdate-0.3.2
humantime-1.3.0
hyper-0.13.2
hyper-0.14.5
hyper-tls-0.4.1
hyper-tls-0.5.0
ident_case-1.0.1
idna-0.1.5
idna-0.2.0
if-addrs-0.6.7
if-addrs-sys-0.3.2
indenter-0.3.2
indexmap-1.7.0
iovec-0.1.4
ipnet-2.3.1
itertools-0.8.2
itoa-0.4.4
js-sys-0.3.51
kernel32-sys-0.2.2
lazy_static-1.4.0
lewton-0.10.2
libc-0.2.98
libmdns-0.6.2
librespot-audio-0.2.0
librespot-connect-0.2.0
librespot-core-0.2.0
librespot-metadata-0.2.0
librespot-playback-0.2.0
librespot-protocol-0.2.0
librespot-tremor-0.2.0
lock_api-0.3.3
log-0.4.8
match_cfg-0.1.0
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.3.0
mime-0.3.16
mime_guess-2.0.1
miniz_oxide-0.4.3
mio-0.6.23
mio-0.7.13
miow-0.2.2
miow-0.3.7
multimap-0.8.3
native-tls-0.2.7
net2-0.2.37
nix-0.20.0
ntapi-0.3.6
num-bigint-0.4.0
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.11.1
object-0.22.0
ogg-0.8.0
ogg-sys-0.0.9
once_cell-1.5.2
opaque-debug-0.3.0
openssl-0.10.35
openssl-probe-0.1.2
openssl-sys-0.9.65
owo-colors-1.2.1
parking_lot-0.9.0
parking_lot_core-0.6.2
pbkdf2-0.8.0
percent-encoding-1.0.1
percent-encoding-2.1.0
pin-project-0.4.8
pin-project-1.0.7
pin-project-internal-0.4.8
pin-project-internal-1.0.7
pin-project-lite-0.1.4
pin-project-lite-0.2.4
pin-utils-0.1.0
pkg-config-0.3.17
ppv-lite86-0.2.10
priority-queue-1.1.1
proc-macro-error-1.0.2
proc-macro-error-attr-1.0.2
proc-macro-hack-0.5.19
proc-macro-nested-0.1.3
proc-macro2-0.4.30
proc-macro2-1.0.27
protobuf-2.14.0
protobuf-codegen-2.14.0
protobuf-codegen-pure-2.14.0
quick-error-1.2.3
quote-0.6.13
quote-1.0.9
rand-0.6.5
rand-0.7.3
rand-0.8.4
rand_chacha-0.1.1
rand_chacha-0.2.1
rand_chacha-0.3.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_core-0.6.3
rand_hc-0.1.0
rand_hc-0.2.0
rand_hc-0.3.1
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
random-0.12.2
rdrand-0.4.0
redox_syscall-0.1.56
regex-1.3.3
regex-syntax-0.6.13
remove_dir_all-0.5.2
reqwest-0.10.1
reqwest-0.11.4
rspotify-0.8.0
rustc-demangle-0.1.16
rustc-serialize-0.3.24
rustc_version-0.2.3
ryu-1.0.2
schannel-0.1.16
scopeguard-1.1.0
security-framework-2.3.1
security-framework-sys-2.3.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.115
serde_derive-1.0.115
serde_json-1.0.44
serde_urlencoded-0.6.1
serde_urlencoded-0.7.0
sha-1-0.9.1
shannon-0.2.0
sharded-slab-0.1.1
shell-words-1.0.0
signal-hook-registry-1.4.0
slab-0.4.2
smallvec-0.6.13
smallvec-1.6.1
socket2-0.4.0
strsim-0.7.0
strsim-0.8.0
structopt-0.3.17
structopt-derive-0.4.10
subtle-2.4.0
syn-0.15.44
syn-1.0.73
syn-mid-0.5.0
synstructure-0.12.3
syslog-4.0.1
tempfile-3.1.0
termcolor-1.1.0
textwrap-0.11.0
thiserror-1.0.26
thiserror-impl-1.0.26
thread_local-1.0.1
time-0.1.42
tinyvec-1.2.0
tinyvec_macros-0.1.0
tokio-0.2.25
tokio-1.8.1
tokio-compat-0.1.6
tokio-compat-02-0.2.0
tokio-current-thread-0.1.6
tokio-executor-0.1.9
tokio-io-0.1.13
tokio-macros-1.3.0
tokio-native-tls-0.3.0
tokio-reactor-0.1.11
tokio-socks-0.2.0
tokio-stream-0.1.7
tokio-sync-0.1.7
tokio-timer-0.2.12
tokio-tls-0.3.0
tokio-util-0.2.0
tokio-util-0.6.7
toml-0.5.8
tower-service-0.3.0
tracing-0.1.22
tracing-attributes-0.1.11
tracing-core-0.1.17
tracing-error-0.1.2
tracing-subscriber-0.2.15
try-lock-0.2.2
typenum-1.12.0
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.11
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.1.0
unicode-xid-0.2.0
url-1.7.2
url-2.2.2
uuid-0.8.2
vcpkg-0.2.8
vec_map-0.8.1
vergen-3.0.4
version_check-0.9.1
want-0.3.0
wasi-0.10.2+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.74
wasm-bindgen-backend-0.2.74
wasm-bindgen-futures-0.4.24
wasm-bindgen-macro-0.2.74
wasm-bindgen-macro-support-0.2.74
wasm-bindgen-shared-0.2.74
web-sys-0.3.51
webbrowser-0.5.2
whoami-0.9.0
widestring-0.4.0
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.3
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
winreg-0.7.0
ws2_32-sys-0.2.1
xdg-2.2.0
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
