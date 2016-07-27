{% set getTrend = getTrend() %}
{% for item in project %}
    <div class="item">
        <div class="entry">
            <a href="{{ url({'for': 'project_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="thumbnail" style="display: block;">
                <div style="background-image: url({{ item['default_image_url'] }})" class="img"></div>
                <div class="caption">
                    <h3 class="title">{{ item['name'] }}</h3>
                    <h3 class="location">{{ item['province_name'] }}</h3>
                </div>
            </a>
        </div>
    </div>
{% endfor %}
<div class="link-more text-center"><a href="{{ url({'for': 'project_list'}) }}" class="link">Xem thêm</a></div>