# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

[[ ${PV} == *9999 ]] && SCM="git-r3"
inherit cmake-utils ${SCM}

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol."
HOMEPAGE="https://github.com/fulhax/ncpamixer"

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/fulhax/ncpamixer.git"
else
	SRC_URI="https://github.com/fulhax/ncpamixer/archive/${PV}.tar.gz \
        -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-sound/pulseaudio sys-libs/ncurses:0/6[unicode]"
DEPEND="dev-util/cmake ${RDEPEND}"

CMAKE_USE_DIR="${S}/src/"

src_configure() {
	local mycmakeargs=("-DUSE_WIDE=TRUE")

	cmake-utils_src_configure
}
