---
layout: page
title: Awards & Certifications
---

<!-- Content lives in _data/awards.yml. -->

## Honours and Awards
{% for a in site.data.awards.awards %}
- {{ a.text }}
{%- for i in a.items %}
  - {{ i }}
{%- endfor %}
{%- for d in a.details %}
  - {{ d }}
{%- endfor %}
{%- endfor %}

## Certifications
{% for c in site.data.awards.certificates %}
- {{ c.text }}
{%- for d in c.details %}
  - {{ d }}
{%- endfor %}
{%- endfor %}
