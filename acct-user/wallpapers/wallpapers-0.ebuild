# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for download wallpapers"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( nobody )

acct-user_add_deps
