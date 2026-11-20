# longpml.github.io

Personal website, built by GitHub Pages (Jekyll, `minima` theme) and deployed by GitHub Actions.

- Home: `index.md`
- Experience: `experience.md`
- Publications: `publications.md`
- Awards and certifications: `awards.md`
- CV: edit `_includes/cv.md`. It is shown on `cv.md` and converted to `cv.pdf` by pandoc on every push.
- Colors: `assets/main.scss`
- Site config and menu order: `_config.yml`

Push to `main`. The site updates at https://longpml.github.io in about two minutes.

Build the CV PDF locally:

```bash
docker run --rm -v "$PWD:/data" -u "$(id -u):$(id -g)" pandoc/latex:3.14 \
  _includes/cv.md -o cv.pdf -V geometry:margin=2cm -V fontsize=11pt -V colorlinks -V pagestyle=empty
```
