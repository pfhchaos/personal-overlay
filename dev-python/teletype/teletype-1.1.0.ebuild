# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{6,7,8,9,10} )

inherit distutils-r1

DESCRIPTION="Python script to manage electronic paper devices made by Sony (Digital Paper, DPT-RP1, DPT-CP1) or Fujitsu (Quaderno) without the Digital Paper App."
HOMEPAGE="https://github.com/janten/dpt-rp1-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

