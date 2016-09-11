# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

inherit distutils python

DESCRIPTION="Open files using MIME-type associations."
HOMEPAGE="http://xyne.archlinux.ca/projects/mimeo"
SRC_URI="http://xyne.archlinux.ca/projects/mimeo/src/${P}.tar.xz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/file"

pkg_setup() {
	python_set_active_version 2
}

src_install() {
	python_convert_shebangs -r 2 .
	distutils_src_install

	dobin ${PN}
}
