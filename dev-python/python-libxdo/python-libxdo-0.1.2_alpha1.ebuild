# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_3,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python bindings for libxdo"
HOMEPAGE="https://github.com/rshk/python-libxdo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-0.1.2a1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/python-xlib[${PYTHON_USEDEP}]"
