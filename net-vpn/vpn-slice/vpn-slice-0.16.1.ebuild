# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{3..12} )
inherit distutils-r1

DESCRIPTION="This is a replacement for the vpnc-script used by OpenConnect or VPNC."
HOMEPAGE="https://github.com/dlenski/vpn-slice"
SRC_URI="https://github.com/dlenski/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/setproctitle[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.16.0[${PYTHON_USEDEP}]
"
