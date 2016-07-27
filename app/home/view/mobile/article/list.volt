{% extends 'mobile_template.volt' %}

{% block title %}{{ category['name'] }}{% endblock %}
{% block description %}{{ category['name'] }}{% endblock %}
{% block keywords %}{{ category['name'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id'] }) }}" />
{% endblock %}

{% block content %}
    <div class="main-content">
        <h1 class="title-style1">{{ category['name'] }}</h1>
        <div class="list-news1">
        {% if articles is defined and articles|length %}
            {% for item  in articles %}
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
            {% endfor %}
        {% endif %}
        </div>

        <div class="pagination">
            {{ paginationLayout }}
        </div>

    </div>
{% endblock %}