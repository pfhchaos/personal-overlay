# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A KVMFR (KVM Frame Relay) Implementation"
HOMEPAGE="https://github.com/gnif/LookingGlass"

EGIT_REPO_URI="https://github.com/Stremio/stremio-shell.git"
EGIT_COMMIT=""

KEYTWORDS="~amd64"

LICENSE=""
SLOT="0"
IUSE=""

RDEPEND="dev-qt/qtwebchannel
dev-qt/qtwebengine
dev-qt/qtquickcontrols2
dev-qt/qtdeclarative5"

#qtquick-dialogs
#qt-labs-platform
#qt-labs-settings
#qt-labs-folderlistmodel

DEPEND="${RDEPEND}"
BDEPEND="dev-qt/qt-creator"
