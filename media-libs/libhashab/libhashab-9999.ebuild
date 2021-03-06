# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 eutils

DESCRIPTION="enables any libgpod compatible player to update an iPod nano 6th gen"
HOMEPAGE="https://github.com/denydias/libhashab"
EGIT_REPO_URI="https://github.com/denydias/libhashab.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+abi_x86_64 +abi_x86_32 nano6"

DEPEND="media-libs/libgpod"
RDEPEND="${DEPEND}"

src_prepare() {
	cp "${FILESDIR}/Makefile" src || die
}

src_compile() {
	cd src
	emake || die
}

src_install() {
	if use nano6; then
		ILIB=libhashab32.so
	else
		ILIB=libhashab_original.so	
	fi
	if use abi_x86_32 & ! use abi_x86_64; then
		insinto /usr/lib/libgpod 
		doins ${ILIB}
	fi
	if use abi_x86_64; then
		insinto /usr/lib/x86_64-linux-gnu/libgpod
		doins ${ILIB} || die
		exeinto /usr/lib/x86_64-linux-gnu/libgpod
		doexe src/libhashab.so src/libhashab32_wrapper || die
		insinto /usr/lib64/libgpod/
		doins ${ILIB} || die
		exeinto /usr/lib64/libgpod
		doexe src/libhashab.so src/libhashab32_wrapper || die
	fi
}
