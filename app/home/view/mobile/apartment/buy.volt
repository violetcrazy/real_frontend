{% extends 'mobile_template.volt' %}

{% block title %}Căn hộ cần bán{% endblock %}
{% block description %}Căn hộ cần bán{% endblock %}
{% block keywords %}Căn hộ cần bán{% endblock %}

{% block content %}
    {% if buyLayout is defined and buyLayout|length %}
        {% for item in buyLayout %}
            {{ item }}
        {% endfor %}
    {% endif %}
{% endblock %}