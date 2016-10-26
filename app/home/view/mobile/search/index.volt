{% extends 'mobile_template.volt' %}

{% block title %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}
{% block description %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}
{% block keywords %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}

{% block top_js %}
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}"/>
{% endblock %}

{% block content %}
    {% set js_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/js/' %}
    <script type="text/javascript" src="{{ js_dir ~ 'search-filter.js?' ~ config.asset.version }}"></script>

    {% set getTrend = getTrend() %}
    {% set priceSort = getSortByPrice() %}
    {% set img_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/img/' %}

    <div class="block-header-tab layout-2">
        <a href="#tab-result" class="active item">Kết quả</a>
        <a href="#tab-filter" class="item">Bộ lọc</a>
        <div class="clearfix"></div>
    </div>

    <div class="wrap-list search-page active" id="tab-result">
        <div class="block-inner1">
            <h1 class="title-style1">Kết quả tìm kiếm
                <div class="des-title">Tìm thấy {{ total_items }} kết quả phù hợp.</div>
            </h1>
        </div>
        <div class="list-style3">
            <div class="entry">
                {% if apartment is not empty %}
                    {% for key, item in apartment %}
                        {% set attrView = '' %}

                        {% if item['attributes'] is defined %}
                            {% for attrKey, attrItem in item['attributes'] %}
                                {% if (attrItem['type'] == 6 and attrView == '') %}
                                    {% set attrView = attrItem %}
                                {% endif %}
                            {% endfor %}
                        {% endif %}
                        {% include 'mobile/apartment/_item_list.volt' %}
                    {% endfor %}
                {% endif %}
            </div>

            <div class="pagination">
                {{ paginationLayout }}
            </div>

        </div>
    </div>

    <div class="wrap-list search-page" id="tab-filter">
        <form id="form-search" action="" method="GET" enctype="multipart/form-data" class="form-search">
            <span class="filed-hidden-smartsearch"></span>
            <input type="hidden" value="{{ limit }}" name="search_limit">
            <input type="hidden" value="{{ sortByPrice }}" name="sort_by_price">
            <span class="basic-search">
                {{ advancedSearchLayout }}
            </span>
            {% include 'mobile/search/_filter.volt' %}

            <div class="clearfix"></div>
            <div class="text-center group-form m-t-15">
                <button class="btn esta-button">Tìm kiếm</button>
            </div>
            <br>
        </form>
    </div>
{% endblock %}
