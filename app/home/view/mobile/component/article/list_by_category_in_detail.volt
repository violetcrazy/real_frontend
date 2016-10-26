{% if results is defined and results|length %}
    <div class="list-news1 m-b-20">
        {% for key, item in results %}
            {% if loop.index <= 2 %}
                <div class="item">
                    <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id'] }) }}" class="link">
                        <div class="thumbnail">
                            <img src="{{ item['default_image'] }}" alt="">
                        </div>
                        <h3 class="title">{{ item['name'] }}</h3>
                    </a>
                    <div class="des">
                        {{ item['intro'] }}
                    </div>
                </div>
            {% else %}
                <div>
                    <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id'] }) }}" class="link-blank">{{ item['name'] }}</a>
                </div>
            {% endif %}
        {% endfor %}

        {% if category is defined and category|length %}
            <div class="link-more text-right">
                <a href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id']}) }}" class="link">Xem thêm</a>
            </div>
        {% endif %}
    </div>
{% endif %}