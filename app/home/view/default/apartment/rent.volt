{% extends 'default_apartment.volt' %}

{% block title %}Căn hộ cho thuê{% endblock %}
{% block description %}Căn hộ cho thuê{% endblock %}
{% block keywords %}Căn hộ cho thuê{% endblock %}

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
