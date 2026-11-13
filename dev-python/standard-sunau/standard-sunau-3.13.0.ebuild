# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Standalone sunau module — restores PEP 594 stdlib removal for Python 3.13+"
HOMEPAGE="https://github.com/youknowone/python-deadlib https://pypi.org/project/standard-sunau/"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/audioop-lts[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
