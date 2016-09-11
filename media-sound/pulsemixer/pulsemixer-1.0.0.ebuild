# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python3_{3,4} )

inherit python-r1

DESCRIPTION="A curses mixer for pulseaudio"
HOMEPAGE="https://github.com/GeorgeFilipkin/pulsemixer"
SRC_URI="https://github.com/GeorgeFilipkin/pulsemixer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${PYTHON_DEPS} media-sound/pulseaudio"

src_install() {
	dobin pulsemixer
	python_replicate_script "${D}/usr/bin/pulsemixer"
	dodoc README.md
}
