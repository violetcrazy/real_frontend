{% extends 'default_apartment.volt' %}

{% block title %}News{% endblock %}
{% block description %}News{% endblock %}
{% block keywords %}News{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}" />
{% endblock %}
{% block breadcrumbs %}
    <div class="breadcrumbs">
        <div class="container">
            <a href="/">Home</a>
            <span class="symbol">></span>
            <a class="current">News</a>
        </div>
    </div>
{% endblock %}
{% block content %}
    {% if articleHotLayout is defined and articleHotLayout != '' %}
        <div class="row-section odd">
            <div class="container">
                {{ articleHotLayout }}
            </div>
        </div>
    {% endif %}
    {% if categories is defined and categories|length %}
        {% for key, item  in categories %}
            {% if key % 2 != 0 and key > 0 %}
                <div class="row-section odd">
            {% else %}
                <div class="row-section">
            {% endif %}
                <div class="container">
                    <h2 class="title-block">{{ item['name'] }}</h2>
                    {% if articleByCategoryLayout[item['id']] is defined and articleByCategoryLayout[item['id']] != '' %}
                          {{ articleByCategoryLayout[item['id']] }}
                    {% endif %}
                </div>
            </div>
        {% endfor %}
    {% else %}
        <div class="container">
            <div style="min-height: 200px">
                Comming soon ...
            </div>
        </div>
    {% endif %}
{% endblock %}

{% block bottom_js %}
    <script>
        $(document).ready(function(){
            $('.new1 .navigation .title').hover(function(){
                var index = $(this).index();
                $('.new1 .entry').css({
                    'top':  - index * 465 + 'px'
                })
            }, function(){})
        });
    </script>
{%  endblock %}
