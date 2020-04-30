---
layout: page
title: Blog
order: 3
---

{% for post in site.posts limit: 5 %}
  {% include post_tease.html %}
{% endfor %}