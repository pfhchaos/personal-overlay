# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PN=${PN/-bin/}

inherit desktop

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.getpostman.com/"
SRC_URI="https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MPL-2.0"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="strip mirror"

S="${WORKDIR}/Postman/app"

src_install() {
	insinto "/opt/${MY_PN}"
	doins -r *

	exeinto "/opt/${MY_PN}"
	doexe Postman

	dosym "/opt/${MY_PN}/Postman" "/usr/bin/${MY_PN}"

	newicon -s 128 "${S}/resources/app/assets/icon.png" postman.png

	make_desktop_entry "postman" \
		"Postman" \
		"/usr/share/icons/hicolor/128x128/apps/postman.png" \
		"Development" #\
		#"Comment=Postman API IDE"
}
