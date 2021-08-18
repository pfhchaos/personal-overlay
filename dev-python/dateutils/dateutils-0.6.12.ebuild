# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="The main purpose of this package is to provide more complex arithmetic operations on dates/times."
HOMEPAGE="https://github.com/jmcantrell/python-dateutils"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}] \
	dev-python/pytz[${PYTHON_USEDEP}]"
