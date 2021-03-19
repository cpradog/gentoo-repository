# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A shell parser and formatter for POSIX shell and bash"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

inherit golang-build

EGO_PN="github.com/mvdan/sh"
EGO_BUILD_FLAGS="-X main.version=v${PV} -extldflags=-static"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/renameio:f0e3298"  #v0.1.0
	"github.com/pkg/diff:5319263"
	"github.com/mvdan/editorconfig:e40951b" #v0.1.1

	"github.com/golang/sys:9197077 -> golang.org/x"
	"github.com/golang/term:ad39bd3 -> golang.org/x"
)

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/mvdan/editorconfig" \
		"mvdan.cc/editorconfig"
}

