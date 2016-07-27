<div class="block-articles m-t-15">
    <h2 class="title-style1 text-center">{{ headerTitle }}</h2>
    <div class="list-style2">
        {% if results is defined and results|length %}
            {% for item in results %}
                {% include 'mobile/apartment/_item_list.volt' %}
            {% endfor %}
        {% endif %}
        <div class="link-more text-center"><a href="" class="link">See more</a></div>
    </div>
</div>
