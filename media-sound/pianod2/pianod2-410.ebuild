# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"


DESCRIPTION="Pianod Pandora music client daemon"
HOMEPAGE="http://projects.mini-dweeb.org/projects/unagi"

SRC_ID="92"
SRC_URI="http://deviousfish.com/Downloads/pianod2/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gnutls libao ffmpeg +access-control +filesystem +gstreamer mbedtls pam +pandora sdl openssl taglib +tls +compression"
REQUIRED_USE="
	|| ( pandora filesystem )
	|| ( gstreamer ffmpeg )
	tls? ( || ( gnutls mbedtls openssl ) )
"

RDEPEND="
	libao? ( media-libs/libao )
	gstreamer? ( media-libs/gstreamer )
	ffmpeg? ( media-video/ffmpeg )
	tls? ( || (
		gnutls? ( net-libs/gnutls )
		mbedtls? ( net-libs/mbedtls )
		openssl? ( virtual/openssl )
	) )
	pandora?  ( net-misc/curl[ssl] )
	compression?  ( sys-libs/zlib )
	access-control? ( sys-apps/tcp-wrappers )
	"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	"

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	sed -e 's/ncurses_LIBS=-lncurses/ncurses_LIBS="$(pkg-config --libs ncurses)"/' -i configure
	econf \
		--enable-shadow=$(usex pam pam passwd) \
		$(use_with compression) \
		$(use_with access-control accesscontrol) \
		--with-engine=$(usex gstreamer gstreamer ffmpeg) \
	    $(use_with tls tls $(usex gnutls gnutls $(usex mbedtls mbedtls openssl))) \
		$(use_with taglib) \
		$(use_with pandora) \
		--without-tonegenerator \
		$(use_with filesystem) \
		$(use_with libao) \
		$(use_with sdl libsdl) \

}
