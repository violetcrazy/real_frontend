{% extends 'mobile_template.volt' %}

{% block title %}{{ article['name'] }}{% endblock %}
{% block description %}{{ article['name'] }}{% endblock %}
{% block keywords %}{{ article['name'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'article_detail', 'slug': article['slug'], 'id': article['id'] }) }}" />
{% endblock %}

{% block content %}
    <div class="main-content">
        <h1 class="title-style1">{{ article['name'] }}</h1>

        <div class="date"><i>Đăng lúc {{ date('H:i:s , d/m/Y', strtotime(article['updated_at'])) }}</i></div>
        <div class="wysiwyg m-b-20">
            {{ article['description'] }}
        </div>

        {% if categories is defined and categories|length %}
            {% for item  in categories %}
                <h2 class="title-style1 big text-center">{{ item['name'] }}</h2>
                {% if articleByCategoryLayout[item['id']] is defined and articleByCategoryLayout[item['id']] != '' %}
                    {{ articleByCategoryLayout[item['id']] }}
                {% endif %}
                <div class="clearfix"></div>
            {% endfor %}
        {% endif %}
    </div>
{% endblock %}
