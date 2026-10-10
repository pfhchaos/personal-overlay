# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
# Single-impl: an end-user application, not a library imported in-process by
# other pythons, so it builds for ONE interpreter.
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Audio-reactive flame fractal wallpaper — Electric Sheep reimagined"
HOMEPAGE="https://github.com/pfhchaos/flame-sheep"
EGIT_REPO_URI="https://github.com/pfhchaos/flame-sheep.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="scoring"
# sci-ml/pytorch is single-target and currently python3.13-only, so CNN
# scoring pins the interpreter.
REQUIRED_USE="scoring? ( python_single_target_python3_13 )"

# RDEPEND = pyproject [project] deps -> portage atoms. flame-sheep-audio is a
# sibling single-impl package (service daemon) → PYTHON_SINGLE_USEDEP, as is
# sci-ml/pytorch (single-target). The rest are multi-impl libraries, wrapped in
# python_gen_cond_dep. The sibling libs (wallpaper-ml, viz-authoring) + vulkan +
# pywayland live in this overlay; moderngl/glcontext are in ::guru. musdb (eval
# dataset loader) is dev-only and stays in the venv (see the dropped eval flag).
RDEPEND="
	dev-python/flame-sheep-audio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
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
		dev-python/wallpaper-ml[${PYTHON_USEDEP}]
		dev-python/viz-authoring[${PYTHON_USEDEP}]
	')
	media-libs/vulkan-loader
	scoring? (
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/scikit-image[${PYTHON_USEDEP}]
		')
	)
"
DEPEND="${RDEPEND}"

# No test phase: the suite needs a GPU (Vulkan) + an audio source, neither
# available in the portage sandbox; tests are validated in the dev venv
# (make test). Installs `flame-sheep` on PATH via the pyproject console script;
# ships shaders + default_config.toml + the CNN scorer weights as package-data.
