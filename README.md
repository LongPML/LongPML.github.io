# longpml.github.io

Personal website, built by GitHub Pages (Jekyll, `minima` theme) and deployed by GitHub Actions.

- Home: `index.md`
- Experience: `experience.md`
- Publications: `publications.md`
- Awards and certifications: `awards.md`
- Résumé: edit `_includes/cv.md`. It is converted to `Minh-Long_Pham_Resume.pdf` by pandoc on every push, and `cv.md` embeds that PDF.
- Site config and menu order: `_config.yml`
- Use `\|` instead of `|` in text lines, otherwise kramdown renders them as a table.

Push to `main`. The site updates at https://longpml.github.io in about two minutes.

Build the CV PDF locally:

```bash
docker run --rm -v "$PWD:/data" -u "$(id -u):$(id -g)" pandoc/latex:3.14 \
  _includes/cv.md -o Minh-Long_Pham_Resume.pdf -V geometry:margin=2cm -V fontsize=11pt -V colorlinks -V pagestyle=empty
```
