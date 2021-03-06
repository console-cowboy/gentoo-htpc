# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Generate QR Code based on libqrencode"
HOMEPAGE="http://phpqrcode.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/releases/${PN}-2010100721_${PV}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-gfx/qrencode
dev-lang/php:*"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_install() {
	insinto "/usr/share/php/${PN}"
	doins *.php || die
	doins -r cache || die
	doins -r bindings || die
	doins -r tools || die

	dodoc README INSTALL CHANGELOG VERSION
}
