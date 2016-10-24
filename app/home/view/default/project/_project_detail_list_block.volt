<div class="list-block">
    <ul class="list-unstyled">
        {% for item in project['blocks'] %}
        <li class="item">
            <div class="entry">
                <div class="thumbnail">
                    <a href="{{ url({'for': 'block_detail', 'slug': item['slug'], 'id': item['id']}) }}">
                        <img src="{{ item['default_image_url'] }}" alt="{{ item['name'] }}"></a>
                </div>
                <div class="summary">
                    <a href="{{ url({'for': 'block_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="title">{{ item['name'] }} </a>
                    <div class="line-info">
                        <div class="item-entry">
                            <p class="line-icon">
                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png" alt="" class="icon">
                                {{ item['direction_text'] }}
                            </p>
                            <p class="line-icon">
                                Số sản phẩm: {{ item['apartment_count'] }}
                            </p>
                        </div>
                        <div class="item-entry">
                            <p class="line-icon">
                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-ha.png" alt="" class="icon">
                                {{ item['total_area'] > 0 ? item['total_area'] : 0 }} ha
                            </p>
                            <p class="line-icon">
                                Còn trống: Đợi update
                            </p>
                        </div>
                        <div class="item-entry">
                            <p class="line-icon">
                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-tree.png" alt="" class="icon">
                                {{ item['green_area'] > 0 ? item['green_area'] : 0 }} m2
                            </p>
                            <p class="line-icon">
                                Đang xử lý: Đợi update
                            </p>
                        </div>
                        <div class="item-entry">
                            <p class="line-icon">
                                <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic_Pen House_20px.png" alt="" class="icon">
                                {{ item['floor_count'] }} tầng
                            </p>
                            <p class="line-icon">
                                Đã bán: Đợi update
                            </p>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </li>
        {% endfor %}
    </ul>
</div>
