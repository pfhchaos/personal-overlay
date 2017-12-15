# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit git-r3 cmake-utils python-single-r1

DESCRIPTION="A fast and easy-to-use status bar"
HOMEPAGE="https://github.com/jaagr/polybar"

EGIT_REPO_URI="https://github.com/jaagr/${PN}"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS=""
else
	EGIT_COMMIT="${PV}"
	KEYWORDS="~amd64"
fi

IUSE="alsa i3 mpd github wifi"
SLOT="0"
LICENSE="MIT"

RDEPEND="${PYTHON_DEPS}
	x11-libs/cairo
	x11-libs/libxcb
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	x11-proto/xcb-proto
	alsa? ( media-libs/alsa-lib )
	github? ( net-misc/curl )
	i3? ( dev-libs/jsoncpp )
	mpd? ( media-libs/libmpdclient )
	wifi? ( net-wireless/wireless-tools )"

DEPEND="${PYTHON_DEPS}
	x11-libs/cairo
	x11-libs/libxcb
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
	x11-proto/xcb-proto"

src_configure() {
	local mycmakeargs=(
		-DENABLE_ALSA="$(usex alsa)"
		-DENABLE_CURL="$(usex github)"
		-DENABLE_I3="$(usex i3)"
		-DENABLE_MPD="$(usex mpd)"
		-DENABLE_NETWORK="$(usex wifi)"
	)

	cmake-utils_src_configure
}
