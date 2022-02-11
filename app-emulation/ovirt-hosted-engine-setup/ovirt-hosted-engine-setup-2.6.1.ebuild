# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
WANT_AUTOCONF=2.5
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit git-r3 autotools python-single-r1

DESCRIPTION="oVirt Task Oriented Pluggable Installer/Implementation"
HOMEPAGE="https://github.com/oVirt/ovirt-hosted-engine-setup"

EGIT_REPO_URI="https://github.com/oVirt/ovirt-hosted-engine-setup"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS="*"
else
	EGIT_COMMIT="${P}"
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

