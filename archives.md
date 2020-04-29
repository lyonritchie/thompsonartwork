---
layout: default
title: Archives
publish: false
---

<section>

 {% include archive.html %}

</section>




<section>

{%comment%} for Archive Page ? {%endcomment%}
  <h3>Archives</h3>
  {% for post in site.posts %}
    {% capture post_month %}{{post.date | date: "%m"}}{% endcapture %}
    {% if post_month != prev_post_month %}{% if prev_post_month %}</ol>{% endif %}
    <h4>{{post.date | date: "%B %Y"}}</h4>
    <ol class="">{% endif %}
  	{% capture prev_post_month %}{{post_month}}{% endcapture %}
  {% endfor %}

</section>
