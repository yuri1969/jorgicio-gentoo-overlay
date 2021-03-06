# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 qmake-utils xdg

DESCRIPTION="Qt-based interface for Optimus Manager"
HOMEPAGE="https://github.com/Shatur95/optimus-manager-qt"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="GPL-3"
SLOT="0"
IUSE="plasma"
RESTRICT="test"

DEPEND="
	dev-qt/qtcore:5
	plasma? (
		kde-plasma/plasma-desktop
		kde-frameworks/knotifications
		kde-frameworks/kiconthemes
	)"
RDEPEND="
	${DEPEND}
	>=x11-misc/optimus-manager-1.0"

src_configure() {
	use plasma && eqmake5 "DEFINES += PLASMA" || eqmake5
}

src_install() {
	INSTALL_ROOT="${D}" default
}
