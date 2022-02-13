# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit git-r3 autotools python-single-r1 systemd

DESCRIPTION="oVirt Task Oriented Pluggable Installer/Implementation"
HOMEPAGE="https://github.com/oVirt/ovirt-hosted-engine-ha"

EGIT_REPO_URI="https://github.com/oVirt/ovirt-hosted-engine-ha"

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
	systemd_dounit "initscripts/ovirt-ha-agent.service"
	systemd_dounit "initscripts/ovirt-ha-broker.service"
	default
}
