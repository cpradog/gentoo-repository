# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: astal.eclass
# @MAINTAINER: cpradog
# @SUPPORTED_EAPIS: 8
# @BLURB: Common ebuild functions for astal packages

case ${EAPI} in
8) ;;
*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_ASTAL_ECLASS} ]]; then
	_ASTAL_ECLASS=1

	inherit git-r3 meson vala gnome2-utils

	EGIT_REPO_URI="https://github.com/aylur/astal"

	DEPEND="
	$(vala_depend)
	dev-lang/vala[valadoc]
"
	BDEPEND="
	dev-libs/gobject-introspection
"

	# @FUNCTION: astal_src_prepare
	# @DESCRIPTION:
	# Prepares the source by patching gir.py to ignore valadoc warnings
	astal_src_prepare() {
		default
		vala_setup

		# Workaround: valadoc generates warnings for Vala reserved keywords (in, out)
		# in documentation comments that don't match parameter names. gir.py runs
		# subprocess with check=True which treats these warnings as fatal errors.
		if [[ -f "${S}/lib/gir.py" ]]; then
			sed -i 's/check=True/check=False/' "${S}/lib/gir.py" || die "Failed to patch gir.py"
		fi

		export VALADOC="$(type -P valadoc-$(vala_best_api_version))"
	}

	# @FUNCTION: astal_pkg_postinst
	# @DESCRIPTION:
	# Compile GSettings schemas after install
	astal_pkg_postinst() {
		gnome2_schemas_update
	}

	# @FUNCTION: astal_pkg_postrm
	# @DESCRIPTION:
	# Recompile GSettings schemas after removal
	astal_pkg_postrm() {
		gnome2_schemas_update
	}

fi

EXPORT_FUNCTIONS src_prepare pkg_postinst pkg_postrm
