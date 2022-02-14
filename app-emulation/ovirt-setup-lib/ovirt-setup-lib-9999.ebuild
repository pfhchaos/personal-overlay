# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit git-r3 autotools python-single-r1

DESCRIPTION="The Vdsm service exposes an API for managing virtualization hosts running the KVM hypervisor technology."
HOMEPAGE="https://github.com/oVirt/vdsm"

EGIT_REPO_URI="https://github.com/oVirt/vdsm"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS="*"
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	${RDEPEND}
	"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_install() {
	default
}
