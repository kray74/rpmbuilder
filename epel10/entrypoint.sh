#!/usr/bin/bash
set -eu

if [ ! -d "/root/rpmbuild/SPECS" ]; then
	rpmdev-setuptree
fi

exec /usr/bin/bash
