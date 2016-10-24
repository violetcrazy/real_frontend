<h3 class="title-style1">Căn hộ tương tự</h3>
<div class="slides-project-other custom-swiper row-main">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            {% if results is defined and results|length %}
                {% for item in results %}
                    <div class="swiper-slide">
                        <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="entry">
                            <div class="thumbnail-custom">
                                <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
                            </div>
                            <div class="caption">
                                <h3 class="title">{{ item['name'] }}</h3>
                            </div>
                        </a>
                    </div>
                {% endfor %}
            {% endif %}
        </div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
</div>
