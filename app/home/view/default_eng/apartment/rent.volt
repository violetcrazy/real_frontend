{% extends 'default_apartment.volt' %}

{% block title %}Apartment for rent{% endblock %}
{% block description %}Apartment for rent{% endblock %}
{% block keywords %}Rent{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'apartment_rent'}) }}" />
{% endblock %}

{% block content %}
    <div class="row-block-apartment m-t-15">
        {% if rentLayout is defined and rentLayout|length %}
            {% for item in rentLayout %}
                {{ item }}
            {% endfor %}
        {% endif %}
    </div>
{% endblock %}
