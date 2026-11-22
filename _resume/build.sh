#!/bin/sh
# Builds _site/Minh-Long_PHAM_Resume.pdf from _site/resume.md, which Jekyll renders from resume.txt.
# Run after the Jekyll build, inside the pandoc/latex image (see README).
set -e
# Try several mirrors because a mirror can be mid-sync and fail signature checks.
ok=
for repo in \
  https://mirror.ctan.org/systems/texlive/tlnet \
  https://mirrors.mit.edu/CTAN/systems/texlive/tlnet \
  https://ftp.math.utah.edu/pub/ctan/tex-archive/systems/texlive/tlnet; do
  if tlmgr --repository "$repo" install tex-gyre fira fontawesome5 xkeyval fontaxes mweights >/dev/null 2>&1; then
    ok=1; break
  fi
done
[ -n "$ok" ] || { echo "tlmgr install failed on all mirrors" >&2; exit 1; }
pandoc _site/resume.md -o _site/Minh-Long_PHAM_Resume.pdf \
  -H _resume/style.tex -L _resume/layout.lua \
  -V papersize=letter -V geometry:margin=0.5in -V fontsize=10pt -V pagestyle=empty \
  -V colorlinks -V urlcolor=linkblue -V linkcolor=linkblue
rm _site/resume.md
