# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{3..10} )
inherit distutils-r1

DESCRIPTION="This is a replacement for the vpnc-script used by OpenConnect or VPNC."
HOMEPAGE="https://github.com/dlenski/vpn-slice"
SRC_URI="mirror://pypi/v/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND="
	dev-python/setproctitle[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.16.0[${PYTHON_USEDEP}]
"
