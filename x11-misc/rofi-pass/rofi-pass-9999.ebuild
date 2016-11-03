# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Rofi interface for Pass password manager"
HOMEPAGE="https://github.com/carnager/rofi-pass"
EGIT_REPO_URI="https://github.com/carnager/rofi-pass.git"

LICENCE="GPL3"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	true;
}

