# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Audio visualization abstraction library."
HOMEPAGE="http://libvisual.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0.4"
KEYWORDS="amd64 ~mips ppc ppc64 x86 ~x86-fbsd"
IUSE="debug nls threads"

RDEPEND="threads? ( >=dev-libs/glib-2 )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

src_compile() {
	econf --enable-static --enable-shared \
		$(use_enable nls) \
		$(use_enable threads) \
		$(use_enable debug)
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog NEWS README TODO
}
