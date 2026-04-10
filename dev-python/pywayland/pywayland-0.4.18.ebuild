# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the libwayland library written in pure Python"
HOMEPAGE="https://github.com/flacjacket/pywayland https://pypi.org/project/pywayland/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-libs/wayland
"
BDEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
"

RESTRICT="test"
