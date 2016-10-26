{% if results is defined and results|length %}
    <div class="slides-news custom-swiper row-main m-b-20">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                {% if (results is defined and results|length > 0) %}
                    {% for key, item in results %}
                        <div class="swiper-slide">
                            <div class="entry">
                                <div class="thumbnail-custom">
                                    <div style="background-image: url({{ item['default_image'] }})" class="img"></div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                {% endif %}
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>


    {% if category is defined and category|length %}
        <div class="link-more text-right">
            <a href="{{ url({'for': 'article_list', 'slug': category['slug'], 'id': category['id']}) }}" class="link">Xem thêm</a>
        </div>
    {% endif %}
{% endif %}