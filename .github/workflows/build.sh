#! /bin/bash

RELEASE=${1:-local-build}
COMMIT_SHORT_SHA=${2:-localb00}

ENTRYPOINT="\def\release{${RELEASE}}\def\commit-short-sha{${COMMIT_SHORT_SHA}}\input{main}"

xelatex "${ENTRYPOINT}"
bibtex "main"
makeglossaries-lite "main"
xelatex "${ENTRYPOINT}"
xelatex "${ENTRYPOINT}"
mv main.pdf eda-le-modele-efqm-${RELEASE}.pdf
