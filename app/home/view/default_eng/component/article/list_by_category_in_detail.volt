{% if results is defined and results|length %}
    <div class="list-news">
        <ul class="list-unstyled">
                {% for item in results %}
                    <li class="item">
                        <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}">
                            <img src="{{ item['default_image_url'] }}" alt="{{ item['name'] }}">
                            <h3 class="title">
                                {{ item['name'] }}
                            </h3>
                        </a>
                    </li>
                {% endfor %}

                {% if category is defined and category|length %}
                    <div class="link-more text-right">

                    </div>
                {% endif %}
        </ul>
        <div class="bottom text-center">
            <a href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id']}) }}" class="btn esta-button">Readmore</a>
        </div>
    </div>
{% else %}
   Comming soon ...
{% endif %}

