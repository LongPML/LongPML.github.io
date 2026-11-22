---
layout: page
title: Experience
---

<!-- Content lives in _data/experience.yml. -->
{% for org in site.data.experience %}
## {{ org.role }}, {{ org.org }}
{{ org.location }} \| {{ org.dates }}{% if org.advisor %} \| Advisor: {{ org.advisor }}{% endif %}
{% for p in org.projects %}
### {{ p.title }}
{% if p.dates %}{{ p.dates }}
{% endif %}
{%- for b in p.bullets %}
- {{ b }}
{%- endfor %}
{%- for d in p.details %}
- {{ d }}
{%- endfor %}
{% endfor %}
{%- endfor %}
