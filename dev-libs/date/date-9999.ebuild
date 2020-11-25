# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A date and time library based on the C++11/14/17 <chrono> header"
HOMEPAGE="https://github.com/HowardHinnant/date"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/HowardHinnant/${PN}"
else
	SRC_URI="https://github.com/HowardHinnant/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="test tz system_tz only_c_locale"
RESTRICT="!test? ( test )"

BDEPEND=""
DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TZ_LIB=$(usex tz)
		-DUSE_SYSTEM_TZ_DB=$(usex system_tz)
		-DENABLE_DATE_TESTING=$(usex test)
		-DCOMPILE_WITH_C_LOCALE=$(usex only_c_locale)
	)
	cmake_src_configure
}
