# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils git-r3
DESCRIPTION="AttractMode emulation frontend"

HOMEPAGE="http://attractmode.org/"

EGIT_REPO_URI="https://github.com/mickelson/attract.git"
EGIT_COMMIT="v2.2.1"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="media-libs/openal
	media-libs/freetype
	media-libs/libsfml
	virtual/opengl
	virtual/glu"

RDEPEND="${DEPEND}"

src_configure() {
	sed -i -e "s:prefix=/usr/local:prefix=/usr:" Makefile || die "Makefile prefix change failed"
}
