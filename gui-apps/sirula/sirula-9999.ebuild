# Copyright 2017-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=8

CRATES="
aho-corasick-0.7.18
anyhow-1.0.44
arrayvec-0.5.2
atk-0.15.1
atk-sys-0.15.1
autocfg-1.0.1
bitflags-1.3.2
bitvec-0.19.5
cairo-rs-0.15.12
cairo-sys-rs-0.15.1
cfg-expr-0.10.3
cfg-if-1.0.0
dirs-4.0.0
dirs-sys-0.3.7
either-1.6.1
field-offset-0.3.4
freedesktop_entry_parser-1.2.0
funty-1.1.0
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-executor-0.3.21
futures-io-0.3.21
futures-macro-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
fuzzy-matcher-0.3.7
gdk-0.15.4
gdk-pixbuf-0.15.11
gdk-pixbuf-sys-0.15.10
gdk-sys-0.15.1
getrandom-0.2.7
gio-0.15.12
gio-sys-0.15.10
glib-0.15.12
glib-macros-0.15.11
glib-sys-0.15.10
gobject-sys-0.15.10
gtk-0.15.5
gtk-layer-shell-0.4.1
gtk-layer-shell-sys-0.4.1
gtk-sys-0.15.3
gtk3-macros-0.15.4
heck-0.4.0
itertools-0.8.2
lazy_static-1.4.0
lexical-core-0.7.6
libc-0.2.126
locale-types-0.4.0
memchr-2.4.1
memoffset-0.6.4
nom-6.1.2
once_cell-1.8.0
osstrtools-0.2.2
pango-0.15.10
pango-sys-0.15.10
pest-2.1.3
pin-project-lite-0.2.7
pin-utils-0.1.0
pkg-config-0.3.20
proc-macro-crate-1.1.0
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.40
quote-1.0.10
radium-0.5.3
redox_syscall-0.2.13
redox_users-0.4.3
regex-1.6.0
regex-syntax-0.6.27
rustc_version-0.3.3
ryu-1.0.5
semver-0.11.0
semver-parser-0.10.2
serde-1.0.138
serde_derive-1.0.138
slab-0.4.4
smallvec-1.9.0
static_assertions-1.1.0
syn-1.0.98
system-deps-6.0.2
tap-1.0.1
thiserror-1.0.30
thiserror-impl-1.0.30
thread_local-1.1.3
toml-0.5.9
ucd-trie-0.1.3
unicode-ident-1.0.1
version-compare-0.1.0
version_check-0.9.3
wasi-0.11.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wyz-0.2.0
xdg-2.4.1
"

inherit cargo

DESCRIPTION="sirula"
HOMEPAGE="Simple app launcher for wayland written in rust"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""
SLOT="0"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DorianRudolph/${PN^}.git"
else
	SRC_URI="$(cargo_crate_uris ${CRATES})"
	SRC_URI="https://github.com/DorianRudolph/${PN^}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DEPEND="
dev-libs/atk
x11-libs/gdk-pixbuf
gui-libs/gtk
gui-libs/gtk-layer-shell
"
RDEPEND=""

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
	git-r3_src_unpack
	cargo_live_src_unpack
	else
	default
	cargo_src_unpack
	fi
}
