# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for running VDSM"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( vdsm )
ACCT_USER_HOME=/var/run/vdsm

acct-user_add_deps
