# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_3,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="An improved Python library for i3wm extensions"
HOMEPAGE="https://github.com/acrisci/i3ipc-python"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/python-xlib[${PYTHON_USEDEP}]"
