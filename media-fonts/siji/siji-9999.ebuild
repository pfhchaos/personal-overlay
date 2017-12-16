# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3

DESCRIPTION="Siji is an iconic bitmap font based on the Stlarch font with additional glyphs."
HOMEPAGE="https://github.com/stark/siji"
EGIT_REPO_URI="https://github.com/stark/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

FONT_S="pcf"
FONT_SUFFIX="pcf"
