<div class="breadcrumbs">
    <div class="container">
        {% if breadcrumbs is defined %}
            {% for item in breadcrumbs %}
                {% if item['active'] %}
                    <a href="" class="current">{{ item['title'] }}</a>
                {% else %}
                    <a href="{{ item['url'] }}">{{ item['title'] }}</a>
                    <span class="symbol">></span>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
</div>