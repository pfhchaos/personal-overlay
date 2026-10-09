# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Framework for audio-reactive Wayland wallpaper visualizations — GPU/worker primitives"
HOMEPAGE="https://github.com/pfhchaos/viz-authoring"
EGIT_REPO_URI="https://github.com/pfhchaos/viz-authoring.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="debug"

# TODO(verify, phase 1.5): dev-python/vulkan is likely OFF-TREE; confirm the
# dev-python/moderngl / glcontext atoms against ::gentoo + ::guru.
RDEPEND="
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	>=dev-python/moderngl-5.0[${PYTHON_USEDEP}]
	dev-python/vulkan[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	media-libs/vulkan-loader
	debug? (
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyopengl[${PYTHON_USEDEP}]
	)
"
DEPEND="${RDEPEND}"

# No test phase: the suite needs a Vulkan device (not in the portage sandbox);
# validated in the dev venv. Ships the demo/utility shaders (vk/shaders/*) as
# package-data.
