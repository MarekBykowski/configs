#!/bin/bash

for f in `find ./ -maxdepth 1 -mindepth 1 -type d`; do
	echo $f
	make clean -C $f
done

