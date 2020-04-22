---
layout: page
title: Galleries
permalink: /galleries/
order: 1
---

<ol>
{% for item in site.collections %}
  {% if item.label != "posts" %}
    <li><a href="/galleries/{{ item.label }}">{{ item.title }}</a></li>
  {% endif %}
{% endfor %}
</ol>
