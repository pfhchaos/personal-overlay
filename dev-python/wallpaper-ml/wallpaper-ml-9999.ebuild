# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Vulkan compute ML framework — PyTorch-style layers, losses, models"
HOMEPAGE="https://github.com/pfhchaos/wallpaper-ml"
EGIT_REPO_URI="https://github.com/pfhchaos/wallpaper-ml.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""

# TODO(verify, phase 1.5): dev-python/vulkan (python bindings) is likely OFF-TREE.
RDEPEND="
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	dev-python/vulkan[${PYTHON_USEDEP}]
	media-libs/vulkan-loader
"
DEPEND="${RDEPEND}"

# No test phase: the suite needs a Vulkan device (not in the portage sandbox);
# validated in the dev venv. Ships the compute shaders (shaders/{cnn,rnn}/*.comp)
# as package-data.
