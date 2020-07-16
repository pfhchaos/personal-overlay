# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A KVMFR (KVM Frame Relay) Implementation"
HOMEPAGE="https://github.com/gnif/LookingGlass"

EGIT_REPO_URI="https://github.com/gnif/LookingGlass"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS=""
else
	EGIT_COMMIT="B2-rc2"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug +host"

RDEPEND="dev-libs/libconfig:0=
	dev-libs/nettle:=[gmp]
	media-libs/freetype:2
	media-libs/fontconfig:1.0
	media-libs/libsdl2
	media-libs/sdl2-ttf
	virtual/glu"
DEPEND="${RDEPEND}
	app-emulation/spice-protocol
	virtual/pkgconfig"

CMAKE_USE_DIR="${S}"/client

src_prepare() {
	default

	# Respect FLAGS
	sed -i '/CMAKE_C_FLAGS/s/-O3 -march=native //' \
		client/CMakeLists.txt || die "sed failed for FLAGS"

	if ! use debug ; then
		sed -i '/CMAKE_C_FLAGS/s/-g //' \
		client/CMakeLists.txt || die "sed failed for debug"
	fi

	cmake-utils_src_prepare
}

src_install() {
	einstalldocs

	dobin "${BUILD_DIR}"/looking-glass-client

	if use host ; then
		insinto /usr/share/"${PN}"
		doins "${DISTDIR}"/looking-glass-host-"${MY_PV}".zip
	fi
}
