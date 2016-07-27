{% if other_block is not empty %}
<div class="other-projects">
    <h3 class="title-block">Block khác</h3>
    <div class="list-project">
        <div class="flexslider slider-other">
            <ul class="slides">
                {% for item in other_block %}
                    <li>
                        <a href="{{ url({ 'for' : 'block_detail', 'slug' : item['slug'], 'id' : item['id'] }) }}">
                            <img src="{{ config.asset.frontend_url ~ 'upload/block/' ~ item['default_image']}}">
                            <h4 class="caption">{{ item['name'] }}</h4>
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>
{% endif %} 