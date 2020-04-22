---
layout: gallery
title: Drawings
---

{% assign items = site.drawings | sort: 'date' | reverse %}
{% for item in items %}
  {% assign thumb = item.image_path | replace: ".jpg", "_tn.jpg" | split: "/" %}

  <div class="card">
    <img 
      class="card-img" 
      src="/{{ thumb[1] }}/{{ thumb[2] }}/thumbnail/{{ thumb.last }}" 
      alt="{{ item.title }}">
    <div class="card-img-overlay">
      <p class="card-title">
        <a class="stretched-link" 
          href="{{ item.url }}">
          {{ item.title }}
        </a>
      </p>
    </div>
  </div>
{% endfor %}