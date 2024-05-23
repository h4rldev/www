#!/usr/bin/env bash

run() {
	pushd $(pwd)/${1}
	just ${2}
	popd
}

run $1 $2
