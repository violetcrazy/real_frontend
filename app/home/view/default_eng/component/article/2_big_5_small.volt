{% if results is defined and results|length %}
    <div class="list-style4">
        <div class="row">
            <div class="entry-left col-xs-6">
              <div class="row">
                {% set i = 0 %}
                {% for item in results %}
                    {% if i < 2 %}
                        <div class="col-xs-6">
                            <div class="wrap-content">
                                <div class="thumbnail">
                                    <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                        <div style="background-image: url({{ item['default_image_url'] }})" class="img">
                                            <img src="{{ item['default_image_url'] }}" alt="{{ item['name'] }}">
                                        </div>
                                    </a>
                                </div>
                                <a href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                    <h3 class="title">
                                       {{ niceWordsByChars(item['name'], 50) }}
                                    </h3>
                                </a>
                                <div class="des">
                                    {{ niceWordsByChars(item['intro'], 80) }}
                                </div>
                            </div>
                        </div>
                    {% endif %}
                    {% set i = i + 1 %}
                {% endfor %}
              </div>
            </div>
            <div class="entry-right col-xs-6">
                <div class="entry">
                    {% set i = 0 %}
                        {% for item in results %}
                            {% if i >= 2 %}
                                <a class="title" href="{{ url({'for': 'article_detail', 'slug': item['slug'], 'id': item['id']}) }}" title="{{ item['name'] }}" >
                                    {{ item['name'] }}
                                </a>
                            {% endif %}
                        {% set i = i + 1 %}
                    {% endfor %}
                </div>
            </div>
        </div>
        {% if category is defined and category|length %}
            <div class="link-more text-right">
                <a href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id']}) }}" class="link">Readmore</a>
            </div>
        {% endif %}
    </div>
{% endif %}
