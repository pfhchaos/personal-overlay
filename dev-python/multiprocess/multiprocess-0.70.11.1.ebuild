# Copyright 1999-202020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="multiprocess is a fork of multiprocessing, and is developed as part of pathos"
HOMEPAGE="https://pypi.org/project/multiprocess/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/dill-0.3.3[${PYTHON_USEDEP}]"
