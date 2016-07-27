{% extends 'mobile_template.volt' %}

{% block title %}Căn hộ cho thuê{% endblock %}
{% block description %}Căn hộ cho thuê{% endblock %}
{% block keywords %}Căn hộ cho thuê{% endblock %}

{% block content %}
    {% if rentLayout is defined and rentLayout|length %}
        {% for item in rentLayout %}
            {{ item }}
        {% endfor %}
    {% endif %}
{% endblock %}