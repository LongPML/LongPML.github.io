# longpml.github.io

Personal website, built by GitHub Pages (Jekyll, `minima` 3 remote theme, `solarized-light` skin) and deployed by GitHub Actions.

## Edit content

All content lives in `_data/`. Each item is written once and reused:

- `_data/experience.yml`: roles and projects.
- `_data/publications.yml`: papers.
- `_data/awards.yml`: awards and certificates.
- `_data/education.yml`: education, shown on the home page and in the résumé.

Fields:

- `bullets` (or `text`, `items`): shown everywhere the item appears.
- `details`: shown only on the full page (Experience, Publications, Awards).
- `highlight: [home, resume]`: show the item on the home page and/or in the résumé. Works in every file; education appears only where it is highlighted.
- `image`: shown on the home page.
- Quote strings that contain `: ` or start with `[`, `*`, or `` ` ``.

## Pages

- Home: `home.md` (`permalink: /`), intro text and links.
- Experience, Publications, Awards: `experience.md`, `publications.md`, `awards.md`. They only loop over `_data/`.
- Résumé: `resume.txt` is a template. Jekyll renders it to `_site/resume.md`, then `_resume/build.sh` builds `_site/Minh-Long_Pham_Resume.pdf` (linked from the home page) and removes `_site/resume.md`.
  - The second front matter block (`name`, `email`, `linkedin`, `website`, `github`) builds the PDF header.
  - `## Section`, `### Role or degree` (bold), `#### Project` (italic), `1.` items print as `[1]` under Publications.
  - `[text]{.center}` and `[text]{.right}` place text in the middle and at the right margin.
  - Layout: `_resume/style.tex`, `_resume/layout.lua`.
  - The PDF is public: no phone numbers or references.
- Site config, skin, and menu order: `_config.yml` (`minima.skin`, `minima.nav_pages`)
- Use `\|` instead of `|` in text lines of web pages, otherwise kramdown renders them as a table.

Push to `main`. The site updates at https://longpml.github.io in about two minutes.

## Build locally

```bash
docker run --rm -u "$(id -u):$(id -g)" -e HOME=/tmp -e PAGES_REPO_NWO=LongPML/LongPML.github.io \
  -v "$PWD:/src" -w /src --entrypoint github-pages ghcr.io/actions/jekyll-build-pages:v1.0.13 \
  build -s /src -d /src/_site
docker run --rm -v "$PWD:/data" -w /data --entrypoint sh pandoc/latex:3.14 \
  -c "_resume/build.sh && chown $(id -u):$(id -g) _site/Minh-Long_Pham_Resume.pdf"
```

Preview: `python3 -m http.server -d _site`, then open http://localhost:8000.
