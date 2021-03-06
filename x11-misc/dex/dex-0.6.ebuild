# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dex/dex-0.6.ebuild,v 1.6 2015/04/08 17:27:17 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )
inherit eutils python-r1

DESCRIPTION="DesktopEntry eXecution - tool to manage and launch autostart entries"
HOMEPAGE="http://e-jc.de/"
SRC_URI="https://github.com/jceb/dex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"

IUSE=""

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-dedupe.patch" || die
	epatch_user
}

src_install() {
	dobin dex
	python_replicate_script "${ED}/usr/bin/dex"
	dodoc README
	doman dex.1
}
