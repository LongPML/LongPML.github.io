---
layout: page
title: Publications
---

<!-- Content lives in _data/publications.yml. -->
{% for p in site.data.publications %}
1. {{ p.authors }}. "[{{ p.title }}]({{ p.url }})." *{{ p.venue }}*, {{ p.year }}{% if p.status %} ({{ p.status }}){% endif %}.
{%- for d in p.details %}
   - {{ d }}
{%- endfor %}
{%- endfor %}
