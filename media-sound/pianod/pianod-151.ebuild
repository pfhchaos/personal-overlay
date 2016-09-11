# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"

inherit eutils autotools-utils

DESCRIPTION="Pianod Pandora music client daemon"
HOMEPAGE="http://projects.mini-dweeb.org/projects/unagi"

SRC_ID="92"
SRC_URI="http://deviousfish.com/Downloads/pianod/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/json-c
	dev-libs/libbsd
	dev-libs/libgcrypt
	media-libs/faad2
	media-libs/libao
	media-libs/libmad
	net-libs/gnutls"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig"


AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1

PATCHES=(
       "${FILESDIR}/${P}-pkgconfig-json.patch"
)



