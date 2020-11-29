#!/bin/bash

REPOS=~/src/github.com/BenLirio/*

for REPO in ${REPOS}
do
	cd "${REPO}"
	git add .
	git commit -m "autosave"
	git branch autosave
	git checkout autosave
done
