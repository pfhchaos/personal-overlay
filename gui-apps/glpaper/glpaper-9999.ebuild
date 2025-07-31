# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial meson

DESCRIPTION="A program that renders glsl shaders as your wallpaper for wlroots based compositors."
HOMEPAGE="https://hg.sr.ht/~scoopta/glpaper"

EHG_REPO_URI="https://hg.sr.ht/~scoopta/glpaper"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-libs/wayland\
	media-libs/mesa"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

