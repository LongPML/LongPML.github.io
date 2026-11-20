#!/bin/sh
# Builds Minh-Long_Pham_Resume.pdf from resume.md. Runs inside the pandoc/latex image (see README).
set -e
tlmgr install tex-gyre >/dev/null
pandoc resume.md -o Minh-Long_Pham_Resume.pdf \
  -H _resume/style.tex -L _resume/layout.lua \
  -V papersize=letter -V geometry:margin=0.6in -V fontsize=11pt -V pagestyle=empty \
  -V colorlinks -V urlcolor=blue -V linkcolor=blue
