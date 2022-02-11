# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
WANT_AUTOCONF=2.5
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit git-r3 autotools python-single-r1

DESCRIPTION="oVirt Task Oriented Pluggable Installer/Implementation"
HOMEPAGE="https://github.com/oVirt/otopi"

EGIT_REPO_URI="https://github.com/oVirt/otopi"

if [[ ${PV} = 9999 ]]; then
	EGIT_BOOTSTRAP=""
	KEYWORDS="*"
else
	EGIT_COMMIT="I77545843c07abe3aa2ff047b44ca81ec85426c68"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
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

