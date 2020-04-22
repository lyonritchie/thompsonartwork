---
layout: gallery
title: Kid Stuff
# permalink: /gallery/:collection/index.html
---

{% for item in site.kid-stuff %}
  <div class="gallery">
    <a href="{{ item.url }}"><img src="{{ item.image_path }}" alt="{{ item.title }}">{{ item.title }}</a>
  </div>
{% endfor %}