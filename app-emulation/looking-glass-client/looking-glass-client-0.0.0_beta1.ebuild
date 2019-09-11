# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A KVMFR (KVM Frame Relay) Implementation"
HOMEPAGE="https://github.com/gnif/LookingGlass"

EGIT_REPO_URI="https://github.com/gnif/LookingGlass"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS=""
else
	EGIT_COMMIT="B1"
	KEYWORDS="~amd64"
fi

IUSE=""
SLOT="0"
LICENSE="GPL-2"

DEPEND="app-emulation/spice-protocol
		media-libs/libsdl2
		media-libs/sdl2-ttf"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/client"

src_install() {
	dobin bin/looking-glass-client
}
