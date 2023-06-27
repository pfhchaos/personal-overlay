# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="mnamer (media renamer) is an intelligent and highly configurable media organization utility."
HOMEPAGE="https://github.com/jkwill87/mnamer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

RDEPEND="
dev-python/guessit
dev-python/requests-cache
dev-python/teletype
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

