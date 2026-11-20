# longpml.github.io

Personal website, built by GitHub Pages (Jekyll, `minima` 3 remote theme, `solarized-light` skin) and deployed by GitHub Actions.

- Home: `index.md`
- Experience: `experience.md`
- Publications: `publications.md`
- Awards and certifications: `awards.md`
- Résumé: edit `resume.md`. It is converted to `Minh-Long_Pham_Resume.pdf` on every push and linked from the home page.
  - Front matter (`name`, `email`, `linkedin`, `website`) builds the page header; the update date is the build date.
  - `## Section`, `### Role or degree` (bold), `#### Project` (italic), `1.` items print as `[1]`.
  - `[text]{.center}` and `[text]{.right}` place text in the middle and at the right margin.
  - Layout: `_resume/style.tex`, `_resume/layout.lua`. Build: `_resume/build.sh`.
  - The PDF is public: no phone numbers or reference contacts.
- Site config, skin, and menu order: `_config.yml` (`minima.skin`, `minima.nav_pages`)
- Use `\|` instead of `|` in text lines of web pages, otherwise kramdown renders them as a table.

Push to `main`. The site updates at https://longpml.github.io in about two minutes.

Build the résumé PDF locally:

```bash
docker run --rm -v "$PWD:/data" -w /data --entrypoint sh pandoc/latex:3.14 \
  -c "_resume/build.sh && chown $(id -u):$(id -g) Minh-Long_Pham_Resume.pdf"
```
