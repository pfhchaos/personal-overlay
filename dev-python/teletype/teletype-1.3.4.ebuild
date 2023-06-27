# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1

DESCRIPTION="teletype is a high-level cross platform tty library compatible with Python 3.7+."
HOMEPAGE="https://github.com/jkwill87/teletype"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

