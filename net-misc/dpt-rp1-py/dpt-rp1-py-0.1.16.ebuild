# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..12} )

inherit distutils-r1

DESCRIPTION="Python script to manage electronic paper devices made by Sony (Digital Paper, DPT-RP1, DPT-CP1) or Fujitsu (Quaderno) without the Digital Paper App."
HOMEPAGE="https://github.com/janten/dpt-rp1-py"
SRC_URI="https://github.com/janten/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

