# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="A rewrite of i3-dmenu-desktop, which is much faster"
HOMEPAGE="https://github.com/enkore/j4-dmenu-desktop"
EGIT_REPO_URI="git://github.com/enkore/j4-dmenu-desktop.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="x11-misc/dmenu"

src_configure() {
	local mycmakeargs=(
		-DNO_TESTS=1
	)
	cmake_src_configure
}
