# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

# WANT_AUTOCONF=latest
# WANT_AUTOMAKE=latest
WX_GTK_VER="3.0"

inherit autotools eutils git-r3 wxwidgets

DESCRIPTION="realize the collective dream of sleeping computers from all over
the internet - this ebuild is a dirty hack to the new SVN based on the old SVN
ebuild, needs a lot of cleaning!"
HOMEPAGE="http://electricsheep.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/scottdraves/electricsheep.git"

IUSE=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/lua
	dev-libs/boost
	dev-libs/tinyxml
	gnome-base/libgtop
	media-libs/freeglut
	media-libs/glee
	media-libs/libpng
	net-misc/curl
	sys-libs/zlib
	virtual/ffmpeg
	x11-libs/libX11
	x11-libs/libXrender
	x11-libs/wxGTK:3.0"

RDEPEND="${DEPEND}
	app-arch/gzip
	=media-gfx/flam3-9999"

src_prepare () {
	mv client_generic/* .
	eautoreconf
}

src_configure() {
	econf
	# get rid of the RUNPATH that interferes with hardware accelerated OpenGL drivers
	sed -i -e '/^hardcode_libdir_flag_spec/d' libtool
}

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"
}

