{% extends 'default_apartment.volt' %}

{% block title %}Apartments for sale{% endblock %}
{% block description %}Apartments for sale{% endblock %}
{% block keywords %}Apartments for sale{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'apartment_buy'}) }}" />
{% endblock %}

{% block content %}
    <div class="row-block-apartment m-t-15">
        {% if buyLayout is defined and buyLayout|length %}
            {% for item in buyLayout %}
                {{ item }}
            {% endfor %}
        {% endif %}
    </div>
{% endblock %}
