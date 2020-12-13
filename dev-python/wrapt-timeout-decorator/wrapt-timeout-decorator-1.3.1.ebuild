# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN="wrapt_timeout_decorator"
DESCRIPTION=""
HOMEPAGE="https://github.com/bitranox/wrapt_timeout_decorator"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}] \
	dev-python/dill[${PYTHON_USEDEP}] \
	dev-python/wrapt[${PYTHON_USEDEP}] \
	dev-python/multiprocess[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_PN}-${PV}

python_configure() {
	sed -i -e "s:'pathlib':'pathlib ; python_version < \"3.4\"':g" setup.py || die
}
