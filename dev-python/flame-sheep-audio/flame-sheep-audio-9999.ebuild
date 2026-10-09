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

IUSE="beatnet watchdog"

# RDEPEND = the pyproject [project] core deps, mapped to portage atoms.
# sounddevice lives in THIS overlay (dev-python/sounddevice).
RDEPEND="
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.16[${PYTHON_USEDEP}]
	>=dev-python/sounddevice-0.5.1[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	watchdog? ( dev-python/systemd-python[${PYTHON_USEDEP}] )
	beatnet? ( dev-python/BeatNet[${PYTHON_USEDEP}] )
"
# TODO(verify atoms): dev-python/pygobject is PyGObject; dev-python/systemd-python
# and dev-python/BeatNet are the uncertain ones — systemd-python may need a
# different atom, and BeatNet is almost certainly OFF-TREE (handle in phase 1.5:
# GURU-first, else author an ebuild). The particle-filter path's native _btrack
# module is provided out-of-package by dev-python/btrack-beat-tracker (this
# overlay) — add it here if/when the PF path becomes a supported runtime option.
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
