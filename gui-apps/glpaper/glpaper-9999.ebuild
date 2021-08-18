# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial meson

DESCRIPTION="A wallpaper program for wlroots based wayland compositors. That allows you to render glsl shaders as your wallpaper"
HOMEPAGE="https://hg.sr.ht/~scoopta/glpaper"

EHG_REPO_URI="https://hg.sr.ht/~scoopta/glpaper"

LICENSE="GPL3"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland\
	media-libs/mesa[egl]\
	virtual/pkgconfig"
DEPEND="dev-util/meson\
	dev-vcs/mercurial\
	${RDEPEND}"

