# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator eutils

MY_VERSION="$(replace_all_version_separators '-')"

DESCRIPTION="Web-of-one-file, small convenient webserver"
HOMEPAGE="http://www.home.unix-ag.org/simon/woof.html"
SRC_URI="http://www.home.unix-ag.org/simon/woof-${MY_VERSION}.py"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	mkdir "${S}"
	cp -L "${DISTDIR}/${A}" "${S}/woof"
	cd "${S}"
	epatch "${FILESDIR}/${PN}"-python2.patch
}

src_install() {
	insinto /etc
	doins "${FILESDIR}/${PN}"rc || die
	dobin woof  || die
}
