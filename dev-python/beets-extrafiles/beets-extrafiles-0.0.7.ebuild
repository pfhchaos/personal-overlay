# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{12..14} )
# Upstream still uses hyphenated sdist filename, pre-PEP625
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="A beets plugin that moves additional files (logs, booklets, art) during import"
HOMEPAGE="https://github.com/Holzhaus/beets-extrafiles https://pypi.org/project/beets-extrafiles/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-sound/beets[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/mediafile-0.6.0[${PYTHON_USEDEP}]
	')
"

# Upstream tests need real audio fixtures and aren't shipped on PyPI.
RESTRICT="test"
