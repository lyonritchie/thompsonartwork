---
layout: gallery
title: Studies
# permalink: /gallery/:collection/index.html
---

{% for item in site.studies %}
  <div class="gallery">
    <a href="{{ item.url }}"><img src="{{ item.image_path }}" alt="{{ item.title }}">{{ item.title }}</a>
  </div>
{% endfor %}