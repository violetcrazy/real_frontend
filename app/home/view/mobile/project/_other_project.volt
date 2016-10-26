{% if other_project is not empty %}
<h3 class="title-style1">Dự án khác</h3>
<div class="slides-project-other custom-swiper row-main">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            {% for item in other_project %}
            <div class="swiper-slide">
                <a  href="{{ url({ 'for' : 'project_detail', 'slug' : item['slug'], 'id' : item['id'] }) }}">
                <div class="entry">
                    <div class="thumbnail-custom">
                        <div style="background-image: url({{ config.cdn.dir_upload ~ item['default_image']}})" class="img"></div>
                    </div>
                    <div class="caption">
                        <h3 class="title">{{ item['name'] }}</h3>
                    </div>
                </div>
                </a>
            </div>
            {% endfor %}
        </div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
</div>
{% endif %}