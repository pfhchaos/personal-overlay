# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3 wxwidgets games


DESCRIPTION="A PlayStation 2 emulator"
HOMEPAGE="http://www.pcsx2.net"
EGIT_REPO_URI="git://github.com/PCSX2/pcsx2.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"

DEPEND="dev-cpp/sparsehash
	media-libs/alsa-lib
	media-libs/glew
	media-libs/libsdl
	media-libs/libsoundtouch
	media-libs/portaudio
	sys-libs/zlib
	virtual/jpeg
	virtual/opengl
	x11-libs/gtk+:2
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/wxGTK:2.8[X]
	x86? (
		dev-libs/libaio
		media-gfx/nvidia-cg-toolkit
	)
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-xlibs
		app-emulation/emul-linux-x86-gtklibs
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-soundlibs
		>=dev-libs/libaio-0.3.109-r4[multilib]
		>=media-gfx/nvidia-cg-toolkit-3.1[multilib]
	)"
RDEPEND="${DEPEND}"

src_unpack() {
		git-r3_src_unpack
		cd "${S}"
}

src_prepare() {
	# Append 32bit opengl include dir
	if use amd64 ; then
		sed '/include_directories/a /usr/lib32/opengl/xorg-x11/include' -i CMakeLists.txt
	fi
	cmake-utils_src_prepare
}

src_configure() {
	use amd64 && local ABI="x86"

	local wxgtk_config=""
	local cg_config=""
	local mylibpath=""

	if use amd64 ; then
		mylibpath="/usr/$(get_libdir)"
		wxgtk_config="-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8-32"
		cg_config="-DCG_LIBRARY=/opt/nvidia-cg-toolkit/lib32/libCg.so
			-DCG_GL_LIBRARY=/opt/nvidia-cg-toolkit/lib32/libCgGL.so"
	else
		mylibpath="/usr/$(get_libdir)"
	fi

	mycmakeargs="-DPACKAGE_MODE=1
		-DCMAKE_VERBOSE_MAKEFILE=TRUE
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_LIBRARY_PATH=${mylibpath}
		-DBUILD_REPLAY_LOADERS=FALSE
		-DCMAKE_BUILD_TYPE=Release
		${wxgtk_config}
		${cg_config}"

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	dogamesbin "${D}usr/bin/${PN}"
	rm "${D}usr/bin/${PN}" || die "rm failed"

	prepgamesdirs
}
