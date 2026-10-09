# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Audio-reactive flame fractal wallpaper — Electric Sheep reimagined"
HOMEPAGE="https://github.com/pfhchaos/flame-sheep"
EGIT_REPO_URI="https://github.com/pfhchaos/flame-sheep.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="scoring"

# RDEPEND = pyproject [project] deps -> portage atoms. The three sibling
# packages are this overlay's own -9999 live ebuilds (unversioned: 9999 is the
# only version). pywayland lives in this overlay.
# TODO(verify, mostly phase 1.5 off-tree): dev-python/vulkan (python bindings)
# and dev-python/musdb are almost certainly OFF-TREE; dev-python/moderngl /
# glcontext / pytorch atoms need confirming against ::gentoo + ::guru.
RDEPEND="
	>=dev-python/moderngl-5.12.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.16[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/glcontext[${PYTHON_USEDEP}]
	dev-python/pywayland[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/vulkan[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/flame-sheep-audio[${PYTHON_USEDEP}]
	dev-python/wallpaper-ml[${PYTHON_USEDEP}]
	dev-python/viz-authoring[${PYTHON_USEDEP}]
	media-libs/vulkan-loader
	scoring? (
		sci-ml/pytorch[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
	)
"
DEPEND="${RDEPEND}"

# No test phase: the suite needs a GPU (Vulkan) + an audio source, neither
# available in the portage sandbox; tests are validated in the dev venv
# (make test). Installs `flame-sheep` on PATH via the pyproject console script;
# ships shaders + default_config.toml + the CNN scorer weights as package-data.
