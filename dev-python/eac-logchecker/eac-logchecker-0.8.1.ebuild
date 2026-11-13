# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Validate Exact Audio Copy (EAC) log file checksums"
HOMEPAGE="https://github.com/OPSnet/eac_logchecker.py https://pypi.org/project/eac-logchecker/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Upstream pins pprp==0.2.6 exactly in the wheel metadata; honor that.
RDEPEND="
	$(python_gen_cond_dep '
		~dev-python/pprp-0.2.6[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
