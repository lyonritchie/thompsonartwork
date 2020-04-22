---
title: Galleries
layout: page
permalink: /galleries/
order: 1
---
<!-- IMPORTANT: Switch editor to Markdown before adding content to this page. -->



<ol>
{% for item in site.collections %}
  {% if item.label != "posts" %}
    <li><a href="/galleries/{{ item.label }}">{{ item.title }}</a></li>
  {% endif %}
{% endfor %}
</ol>
