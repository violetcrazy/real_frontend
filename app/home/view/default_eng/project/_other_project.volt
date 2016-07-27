{% if other_project is not empty %}
    <div class="other-projects">
        <h3 class="title-block">Other project</h3>
        <div class="list-project">
            <div class="flexslider slider-other">
                <ul class="slides">
                    {% for item in other_project %}
                        <li>
                            <a href="{{ url({ 'for' : 'project_detail', 'slug' : item['slug'], 'id' : item['id'] }) }}">
                                <img src="{{ config.cdn.dir_upload ~ item['default_image']}}">
                                <h4 class="caption">{{ item['name_eng'] }}</h4>
                            </a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>
{% endif %}