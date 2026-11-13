# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Validate XLD (X Lossless Decoder) log file checksums"
HOMEPAGE="https://github.com/OPSnet/xld_logchecker.py https://pypi.org/project/xld-logchecker/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Pure stdlib — no runtime deps.
RESTRICT="test"
