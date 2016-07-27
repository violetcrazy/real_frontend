{% if results is defined and results|length %}
    <div class="list-style3 new1">
        <div class="navigation">
            {% for item in results %}
                <a class="title block" href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                    <span class="text">{{ item['name'] }}</span>
                </a>
            {% endfor %}
        </div>
        <div class="entry">
            {% for item in results %}
                <div class="item">
                    <div class="thumbnail">
                        <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
                    </div>
                    <div class="caption">
                        <div class="title">{{ niceWordsByChars(item['intro'], 60) }}</div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
{% endif %}