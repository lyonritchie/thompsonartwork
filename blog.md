---
layout: page
title: Blog
order: 3
---

{% for post in site.posts limit: 5 %}
  <h3>
    <a href="{{ post.url }}">{{ post.title }}</a>
  </h3>
  <p>
    {{ post.excerpt }}
  </p>
  <p><a href="{{ post.url }}">Read more...</a></p>
{% endfor %}
