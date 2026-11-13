# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Pure-Python Rijndael (AES) and PBKDF2 library"
HOMEPAGE="https://github.com/dsoprea/RijndaelPbkdf https://pypi.org/project/pprp/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

# Upstream tests require network + fixtures not shipped on PyPI.
RESTRICT="test"
