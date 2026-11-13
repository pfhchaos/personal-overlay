# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="CLI scraper maintaining gamelists and artwork for emulator frontends"
HOMEPAGE="https://gemba.github.io/skyscraper/ https://github.com/Gemba/Skyscraper"
# Upstream is the living Gemba fork; the original muldjord tree is dead (3.7.7, no ES-DE).
# GitHub tag has no 'v' prefix; the archive unpacks to lowercase ${P} (skyscraper-${PV}),
# NOT the capitalised repo name -- so S is just ${WORKDIR}/${P}. (Verified at emerge
# 2026-11-13: the capitalised S failed the prepare phase.)
SRC_URI="https://github.com/Gemba/Skyscraper/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="7zip"
RESTRICT="mirror"

# qtbase USE flags verified present on this system: network sql sqlite xml.
# Skyscraper's .pro declares: QT += core network sql xml  (sqlite = runtime SQL driver for its cache db).
RDEPEND="
	dev-qt/qtbase:6[network,sql,sqlite,xml]
	7zip? ( app-arch/7zip )
"
DEPEND="${RDEPEND}"
BDEPEND="dev-qt/qtbase:6"

src_configure() {
	# .pro honours $PREFIX (-> /usr/bin, /etc/skyscraper) and $SYSCONFDIR.
	export PREFIX="${EPREFIX}/usr"
	export SYSCONFDIR="${EPREFIX}/etc"
	eqmake6
}

src_install() {
	emake INSTALL_ROOT="${D}" install

	# Upstream installs helper/supplementary scripts straight into /usr/bin;
	# they don't belong there. Keep only the Skyscraper binary.
	rm -f "${D}${EPREFIX}"/usr/bin/*.py "${D}${EPREFIX}"/usr/bin/*.sh \
		"${D}${EPREFIX}"/usr/bin/*.md 2>/dev/null || die
}

pkg_postinst() {
	elog "On first run, Skyscraper copies config templates into ~/.skyscraper/"
	elog "(or \${XDG_CONFIG_HOME}/skyscraper)."
	elog ""
	elog "ES-DE output (two passes — cache first, then render):"
	elog "  Skyscraper -p <platform> -s screenscraper -u \"\$(pass show screenscraper)\" -i <romdir>"
	elog "  Skyscraper -p <platform> -f esde -i <romdir> -g ~/ES-DE/gamelists -o ~/ES-DE/downloaded_media"
	elog ""
	elog "Passing creds via -u \"\$(pass show ...)\" keeps them out of ~/.skyscraper/config.ini"
	elog "and out of version control. (Trade-off: -u exposes the secret in argv for the"
	elog "duration of the run; a 0600 config.ini avoids that but stores the cred in a file.)"
}
