# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Ultimate Python binding for the Vulkan API (cffi, ABI mode)"
HOMEPAGE="
	https://github.com/realitix/vulkan
	https://pypi.org/project/vulkan/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Pure-Python cffi ABI-mode binding — no compiled extension; it dlopen()s the
# Vulkan loader at runtime, so vulkan-loader is a runtime dep, not just BDEPEND.
RDEPEND="
	>=dev-python/cffi-1.10[${PYTHON_USEDEP}]
	media-libs/vulkan-loader
"
