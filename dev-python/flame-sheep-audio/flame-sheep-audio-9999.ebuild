# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 git-r3 systemd

DESCRIPTION="Real-time audio analysis engine — beat detection, energy tracking, tempo"
HOMEPAGE="https://github.com/pfhchaos/flame-sheep-audio"
EGIT_REPO_URI="https://github.com/pfhchaos/flame-sheep-audio.git"

LICENSE="GPL-3+"
SLOT="0"
# Live ebuild: no KEYWORDS (unmask with package.accept_keywords ** in 1.6).
KEYWORDS=""

IUSE="watchdog"

# RDEPEND = the pyproject [project] core deps, mapped to portage atoms.
# sounddevice lives in THIS overlay (dev-python/sounddevice).
RDEPEND="
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.16[${PYTHON_USEDEP}]
	>=dev-python/sounddevice-0.5.1[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	watchdog? ( dev-python/python-systemd[${PYTHON_USEDEP}] )
"
# dev-python/pygobject is PyGObject; dev-python/python-systemd (the watchdog
# dep) is in ::gentoo. The beatnet_lite detector's BeatNet oracle and its
# native particle-filter module are eval/dev-only — they live in the dev venv,
# not portage (see the dropped beatnet USE flag), so no atom for them here.
DEPEND="${RDEPEND}"
# scikit-build-core pulls itself via DISTUTILS_USE_PEP517; it needs a toolchain,
# cmake, ninja and pybind11 headers to compile the _prtcqt extension.
BDEPEND="
	>=dev-python/pybind11-2.12[${PYTHON_USEDEP}]
	dev-build/cmake
	dev-build/ninja
"

python_install_all() {
	distutils-r1_python_install_all

	# Install the vendored systemd *user* unit to the system location so
	# `systemctl --user enable flame-sheep-audio` works post-merge. The unit
	# is de-hardcoded (ExecStart=flame-sheep-audio, resolved from PATH).
	systemd_douserunit "${S}"/src/flame_sheep_audio/data/systemd/flame-sheep-audio.service
}
