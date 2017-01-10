# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

# WANT_AUTOCONF=latest
# WANT_AUTOMAKE=latest
WX_GTK_VER="2.9"

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

# I think pygobject and libgtop are required, and I'm sure glee (e.g. from jensp
# overlay), wxGTK:2.9 and tinyxml are required. Hope I got all dependencies.
# Didn't test if all of the old (sourceforge SVN version) dependencies are
# required or not. I *think* mplayer can be dropped now. -VA

DEPEND="dev-libs/expat
	>=dev-util/pkgconfig-0.9.0
	>=gnome-base/libglade-2.5.0:2.0
	>=virtual/ffmpeg-0.6
	sys-libs/zlib
	>=x11-libs/gtk+-2.7.0:2
	x11-libs/libX11
	x11-proto/xproto
	x11-libs/wxGTK:2.9 
	dev-lang/lua
	dev-libs/tinyxml
	media-libs/glee
	dev-python/pygobject
	gnome-base/libgtop"
RDEPEND="${DEPEND}
	app-arch/gzip
	=media-gfx/flam3-9999
	media-video/mplayer
	net-misc/curl
	x11-misc/xdg-utils"

src_prepare () {
	epatch "${FILESDIR}/electricsheep-updated-function-names.patch"
	mv client_generic/* .
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"

	# install the xscreensaver config file
	# insinto /usr/share/xscreensaver/config
	# doins menu-entries/${PN}.xml || die "${PN}.xml failed"
	# Is there a kde4 .desktop file? why, yes, there is! 
}

