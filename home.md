---
layout: home
permalink: /
---

<!-- Education and highlights come from _data/. Items appear here when their highlight list contains "home". -->

AI Engineer with experience in Machine Learning, Computer Vision, and Reinforcement Learning.
Strong background in mathematics, problem-solving, and computational thinking.

[Email](mailto:longpml3421@gmail.com) \| [LinkedIn](https://linkedin.com/in/longpml/) \| [GitHub](https://github.com/LongPML) \| [Résumé (PDF)](Minh-Long_Pham_Resume.pdf)

## Education
{% assign edu = site.data.education | where_exp: "e", "e.highlight contains 'home'" %}
{%- for e in edu %}
### {{ e.degree }}, {{ e.school }}
{{ e.location }} \| {{ e.dates }}
{% for b in e.bullets %}
- {{ b }}
{%- endfor %}
{%- for d in e.details %}
- {{ d }}
{%- endfor %}
{% endfor %}
## Highlights
{% for org in site.data.experience %}
{%- for p in org.projects %}
{%- if p.highlight contains 'home' %}
### {{ p.title }}
{{ org.org }}{% if p.dates %} \| {{ p.dates }}{% endif %}
{% for b in p.bullets %}
- {{ b }}
{%- endfor %}
{% if p.image %}
![{{ p.title }}]({{ p.image }})
{% endif %}
{%- endif %}
{%- endfor %}
{%- endfor %}
{%- assign pubs = site.data.publications | where_exp: "p", "p.highlight contains 'home'" %}
{%- if pubs.size > 0 %}

### Selected Publications
{% for p in pubs %}
1. {{ p.authors }}. "[{{ p.title }}]({{ p.url }})." *{{ p.venue }}*, {{ p.year }}.
{%- endfor %}
{% endif %}
{%- assign awards = site.data.awards.awards | where_exp: "a", "a.highlight contains 'home'" %}
{%- if awards.size > 0 %}

### Selected Awards
{% for a in awards %}
- {{ a.text }}
{%- endfor %}
{% endif %}
{%- assign certs = site.data.awards.certificates | where_exp: "c", "c.highlight contains 'home'" %}
{%- if certs.size > 0 %}

### Selected Certificates
{% for c in certs %}
- {{ c.text }}
{%- endfor %}
{% endif %}

See all in [Experience](experience.html), [Publications](publications.html), and [Awards](awards.html).
