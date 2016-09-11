# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games cmake-utils

if [[ ${PV} == 9999* ]]
then
	EGIT_REPO_URI="https://github.com/citra-emu/${PN}"
	inherit git-r3
	KEYWORDS=""
else
	#TODO
	SRC_URI=""
	KEYWORDS="~amd64"
fi

DESCRIPTION="Nintendo 3DS emulator"
HOMEPAGE="https://citra-emu.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="png qt5 sdl"
REQUIRED_USE="|| ( qt5 sdl )"

DEPEND="
	dev-libs/boost
	dev-util/desktop-file-utils
	dev-util/cmake
	x11-misc/shared-mime-info
	png? ( media-libs/libpng )
	qt5? (
		dev-qt/qtopengl:5
		dev-qt/qtwidgets:5
	)
	sdl? ( media-libs/libsdl2 )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}"
		$( cmake-utils_use_enable qt5 QT )
		$( cmake-utils_use_enable sdl SDL2 )
	)
	cmake-utils_src_configure
}
