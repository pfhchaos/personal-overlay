# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
PYTHON_REQ_USE="tk"

inherit distutils-r1

DESCRIPTION="Andriller - is software utility with a collection of forensic tools for smartphones."
HOMEPAGE="https://github.com/den4uk/andriller"
SRC_URI="https://github.com/den4uk/${P}/archive/${V}.tar.gz -> ${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-util/android-tools \
	dev-python/wheel[${PYTHON_USEDEP}] \
	>=dev-python/dateutils-0.6.7[${PYTHON_USEDEP}] \
	>=dev-python/javaobj-py3-0.4.1[${PYTHON_USEDEP}] \
	>=dev-python/pycryptodomex-3.9.7[${PYTHON_USEDEP}] \
	>=dev-python/python-dateutil-0.6.7[${PYTHON_USEDEP}] \
	>=dev-python/xlsxwriter-1.2.8[${PYTHON_USEDEP}] \
	>=dev-python/jinja-2.11.2[${PYTHON_USEDEP}] \
	>=dev-python/wrapt-timeout-decorator-1.3.1[${PYTHON_USEDEP}] \
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}] \
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]"
