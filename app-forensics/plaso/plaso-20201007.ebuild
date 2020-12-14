# Copyright 1999-202020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Plaso (Plaso Langar Að Safna Öllu), or super timeline all the things, is a Python-based engine used by several tools for automatic creation of timelines."
HOMEPAGE="https://github.com/log2timeline/plaso"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/pip-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/artifacts-20190305[${PYTHON_USEDEP}]
	dev-python/bencodepy[${PYTHON_USEDEP}]
	>=dev-python/certifi-2016.9.26[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.9.1[${PYTHON_USEDEP}]
	>=dev-python/chardet-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/dfdatetime-20200824[${PYTHON_USEDEP}]
	>=dev-python/dfvfs-20201114[${PYTHON_USEDEP}]
	>=dev-python/dfwinreg-20201002[${PYTHON_USEDEP}]
	>=dev-python/dtfabric-20200621[${PYTHON_USEDEP}]
	>=dev-python/elasticsearch-7.0[${PYTHON_USEDEP}]
	>=dev-python/future-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/idna-2.5[${PYTHON_USEDEP}]
	>=dev-python/libbde-python-20140531[${PYTHON_USEDEP}]
	>=dev-python/libcreg-python-20200725[${PYTHON_USEDEP}]
	>=dev-python/libesedb-python-20150409[${PYTHON_USEDEP}]
	>=dev-python/libevt-python-20191104[${PYTHON_USEDEP}]
	>=dev-python/libevtx-python-20141112[${PYTHON_USEDEP}]
	>=dev-python/libewf-python-20131210[${PYTHON_USEDEP}]
	>=dev-python/libfsapfs-python-20201107[${PYTHON_USEDEP}]
	>=dev-python/libfsext-python-20200819[${PYTHON_USEDEP}]
	>=dev-python/libfshfs-python-20201103[${PYTHON_USEDEP}]
	>=dev-python/libfsntfs-python-20200805[${PYTHON_USEDEP}]
	>=dev-python/libfsxfs-python-20201114[${PYTHON_USEDEP}]
	>=dev-python/libfvde-python-20160719[${PYTHON_USEDEP}]
	>=dev-python/libfwnt-python-20180117[${PYTHON_USEDEP}]
	>=dev-python/libfwsi-python-20150606[${PYTHON_USEDEP}]
	>=dev-python/liblnk-python-20150830[${PYTHON_USEDEP}]
	>=dev-python/libluksde-python-20200101[${PYTHON_USEDEP}]
	>=dev-python/libmsiecf-python-20150314[${PYTHON_USEDEP}]
	>=dev-python/libolecf-python-20151223[${PYTHON_USEDEP}]
	>=dev-python/libqcow-python-20131204[${PYTHON_USEDEP}]
	>=dev-python/libregf-python-20201002[${PYTHON_USEDEP}]
	>=dev-python/libscca-python-20190605[${PYTHON_USEDEP}]
	>=dev-python/libsigscan-python-20190629[${PYTHON_USEDEP}]
	>=dev-python/libsmdev-python-20140529[${PYTHON_USEDEP}]
	>=dev-python/libsmraw-python-20140612[${PYTHON_USEDEP}]
	>=dev-python/libvhdi-python-20131210[${PYTHON_USEDEP}]
	>=dev-python/libvmdk-python-20140421[${PYTHON_USEDEP}]
	>=dev-python/libvshadow-python-20160109[${PYTHON_USEDEP}]
	>=dev-python/libvslvm-python-20160109[${PYTHON_USEDEP}]
	>=dev-python/lz4-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/pefile-2018.8.8[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.4.3[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.3.0[${PYTHON_USEDEP}]
	<dev-python/pyparsing-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
	>=dev-python/pytsk3-20160721[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-2.1.11[${PYTHON_USEDEP}]
	>=dev-python/redis-3.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.21.1[${PYTHON_USEDEP}]
	>=dev-python/yara-python-3.4.0[${PYTHON_USEDEP}]
	"
