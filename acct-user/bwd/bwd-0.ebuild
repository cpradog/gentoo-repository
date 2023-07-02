EAPI=8

inherit acct-user

DESCRIPTION="user for bwd service"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( nobody )

acct-user_add_deps
