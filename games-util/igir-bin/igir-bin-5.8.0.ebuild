# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Zero-setup ROM collection manager: sort, filter, extract, patch ROMs"
HOMEPAGE="https://igir.io/ https://github.com/emmercm/igir"
# Upstream ships self-contained, bun-compiled standalone executables as release
# assets (one file, no Node runtime, no node_modules). We install that prebuilt
# binary rather than building the TypeScript source: the npm/GitHub-tag route
# would drag in a Node toolchain plus ~26 npm deps fetched at build time, which
# a single-tool personal overlay has no reason to carry. GitHub tag is v${PV};
# the Linux amd64 asset unpacks to a bare 'igir' executable in ${WORKDIR}.
SRC_URI="
	amd64? ( https://github.com/emmercm/igir/releases/download/v${PV}/igir-${PV}-Linux-amd64.tar.gz )
	arm64? ( https://github.com/emmercm/igir/releases/download/v${PV}/igir-${PV}-Linux-arm64v8.tar.gz )
"
S="${WORKDIR}"

# package.json declares SPDX "GPL-3.0-or-later" -> Gentoo GPL-3+.
LICENSE="GPL-3+"
SLOT="0"
# -* : this is a prebuilt binary; only keyword the arches upstream ships.
KEYWORDS="-* ~amd64 ~arm64"

# strip: the bun-compiled executable embeds its own JS runtime; stripping it
#   can corrupt the appended payload, so leave it intact.
# test: no source tree, nothing to run.
RESTRICT="strip test"

QA_PREBUILT="usr/bin/igir"

# The bun single-file executable is self-contained apart from glibc, which is
# already in @system; no further RDEPEND.

src_install() {
	dobin igir
}

pkg_postinst() {
	elog "igir is a self-contained prebuilt binary (bun-compiled); it needs no"
	elog "Node.js at runtime. Quick start (copy, don't move, source ROMs):"
	elog ""
	elog "  igir copy zip test \\"
	elog "    --dat \"No-Intro*.zip\" \\"
	elog "    --input <romdir> \\"
	elog "    --output <sorted-outdir>"
	elog ""
	elog "DATs drive matching/renaming; grab them from No-Intro / Redump."
	elog "Full command reference: https://igir.io/"
}
