# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4} )

inherit distutils-r1 versionator

MY_P="${PN}-$(replace_version_separator 3 -)"

DESCRIPTION="WebSocket and WAMP for Twisted and Asyncio"
HOMEPAGE="https://pypi.python.org/pypi/autobahn http://autobahn.ws/python/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	>=dev-python/asyncio-0.2.1[$(python_gen_usedep python3*)]
	>=dev-python/futures-2.1.5[$(python_gen_usedep python2*)]
	>=dev-python/lz4-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/msgpack-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/snappy-0.5[${PYTHON_USEDEP}]
	>=dev-python/trollius-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/twisted-core-11.1[$(python_gen_usedep python2*)]
	>=dev-python/txaio-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/ujson-1.33[${PYTHON_USEDEP}]
	>=dev-python/wsaccel-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.6[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND}
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}"/${MY_P}

python_test() {
	esetup.py test
}
