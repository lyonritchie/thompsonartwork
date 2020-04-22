---
layout: page
title: Galleries
permalink: /gallery/
order: 1
---

<ol>
{% for item in site.collections %}
  {% if item.label != "posts" %}
    <li><a href="/gallery/{{ item.label }}">{{ item.title }}</a></li>
  {% endif %}
{% endfor %}
</ol>
