{% if results is defined and results|length %}
    <div class="list-style4">
        <div class="entry">
            {% for key, item in results %}
                <div class="item">
                        <div class="thumbnail">
                            <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                <div style="background-image: url({{ item['default_image_url'] }})" class="img">
                                    <img src="{{ item['default_image_url'] }}" alt="{{ item['name'] }}">
                                </div>
                            </a>
                        </div>
                        <div class="summary">
                            <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                <h3 class="title">
                                    {{ niceWordsByChars(item['name'], 200) }}
                                </h3>
                            </a>
                            <div class="entry">
                                {% if key == 0 %}
                                    {{ niceWordsByChars(item['intro'], 500) }}
                                {% else %}
                                    {{ niceWordsByChars(item['intro'], 340) }}
                                {% endif %}
                            </div>
                        </div>
                    </a>
                </div>
            {% endfor %}

            {% if category is defined and category|length %}
                <div class="link-more text-right">
                    <a href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id']}) }}" class="link">Readmore</a>
                </div>
            {% endif %}
        </div>
    </div>
{% endif %}
