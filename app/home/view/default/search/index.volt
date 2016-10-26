{% extends 'default_home.volt' %}
{% block title %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}
{% block description %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}
{% block keywords %}Kết quả tìm kiếm - {{ ' Trang ' ~ page }} {% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}search.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}apartment.js?{{ config.asset.version }}"></script>

    <link rel="stylesheet" href="{{ config.asset.frontend_url ~ 'plugins/owl/assets/owl.carousel.css' }}?{{ config.asset.version }}">
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'plugins/owl/owl.carousel.min.js' }}?{{ config.asset.version }}"></script>
    <script>
        $(document).ready(function(){
            $('.owl-thumbnail-slide').owlCarousel({
                items:1,
                lazyLoad:true,
                loop:true,
                margin:0,
                nav:true,
                autoHeight:true
            });
        });
    </script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}"/>
{% endblock %}

{% block content %}
    {% set getTrend = getTrend() %}
    {% set priceSort = getSortByPrice() %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

    <div class="container m-b-50">
        <div class="row">
            <div class="col-xs-3">
                <form id="form-search" action="" method="GET" enctype="multipart/form-data" class="form-search">
                    <span class="filed-hidden-smartsearch"></span>
                    <input type="hidden" value="{{ limit }}" name="search_limit">
                    <input type="hidden" value="{{ sortByPrice }}" name="sort_by_price">
                    <span class="basic-search">
                        {{ advancedSearchLayout }}
                    </span>
                    {% include 'default/search/_filter.volt' %}
                </form>
            </div>
            <div class="col-xs-9">
                <h2 class="title-block title-page-search">Kết quả tìm kiếm</h2>
                <div id="mess-save-search"></div>
                <div class="des-title">Tìm thấy <b class="text-danger"> {{ total_items }} </b> căn hộ phù hợp.
                    {% if (total_items > 0) %}
                        Hiển thị
                        <b class="text-danger">
                            {{ article_min == 0 ? 1 : article_min }} - {{ article_max }}.
                        </b>
                        <button class="btn esta-button" id="save-search">Save Search</button>
                    {% endif %}
                </div>

                <div class="filter-selected">
                    Tiêu chí đã chọn
                </div>
                <div class="sort-wrap">
                    <span class="text-intro">Sắp xếp</span>

                    <div class="content-sort">
                        <div class="item">
                            <div class="dropdown custom-select">
                                <input type="hidden" id="limit" name="search_limit" data-value="{{ limit }}" value="{{ limit }}" />
                                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                    <span class="text">Hiển thị {% if limit is defined %}{{ limit }}{% endif %}</span>
                                    <span class="arrow"></span>
                                </button>
                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                    {% set j = 15 %}
                                    {% for i in 1..4 %}
                                        {% if limit is defined and limit == j %}
                                            <li class="active">
                                                <a href="" class="limit_select" data-value="{{ j }}">
                                                    Hiển thị {{ j }}
                                                </a>
                                            </li>
                                        {% else %}
                                            <li>
                                                <a href="" class="limit_select" data-value="{{ j }}">
                                                    Hiển thị {{ j }}
                                                </a>
                                            </li>
                                        {% endif %}

                                        {% set j = j + 15 %}
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>

                        {% if priceSort is defined %}
                            <div class="item">
                                <div class="dropdown custom-select">
                                    <input type="hidden" id="sort_by_price" name="sort_by_price" data-value="{{ sortByPrice is defined  ? sortByPrice : '1' }}" value="{{ sortByPrice is defined  ? sortByPrice : '1' }}"/>
                                    <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                        <span class="text">{{ priceSort[sortByPrice is defined ? sortByPrice : '1'] }}</span>
                                        <span class="arrow"></span>
                                    </button>
                                    <ul aria-labelledby="type-project" class="dropdown-menu">
                                        {% for key, item in priceSort %}
                                            {% if sortByPrice is defined and sortByPrice == key %}
                                                <li class="active">
                                                    <a href="" class="sort_select" data-value="{{ key }}">{{ item }}</a>
                                                </li>
                                            {% else %}
                                                <li>
                                                    <a href="" class="sort_select" data-value="{{ key }}">{{ item }}</a>
                                                </li>
                                            {% endif %}
                                        {% endfor %}
                                    </ul>
                                </div>
                            </div>
                        {% endif %}

                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="result-search m-t-20">
                    <div class="wrap-list">
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
                                <div class="item">

                                    {% if (item['gallery'] is defined and item['gallery']|length > 0) %}
                                        <div class="entry-slide-thumb">
                                            <div class="owl-carousel owl-theme owl-thumbnail-slide">
                                                {% for image in  item['gallery']%}
                                                    <img alt="{{ item['name'] }}" class="owl-lazy" data-src="{{ config.cdn.dir_upload ~ 'thumbnail/' ~ image }}">
                                                {% endfor %}
                                            </div>
                                        </div>
                                    {% else %}
                                        <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="thumbnail">
                                            <div class="img" style="background-image: url({{ item['default_image_url'] }});"></div>
                                            <img src="{{ item['default_image_url'] }}"/>

                                        </a>
                                    {% endif %}

                                    <div class="summary">
                                        <h3 class="title">{{ item['name'] }}</h3>

                                        <div class="address">
                                            <div class="line-icon">
                                                <span class="icon">
                                                    <img src="{{ img_dir }}icon/ic_Pen House_20px.png" />
                                                </span>
                                                {{ item['project']['name'] }}
                                            </div>
                                            <div class="line-icon">
                                                <span class="icon">
                                                    <img src="{{ img_dir }}icon/ic-location-small.png" />
                                                </span>
                                                {{ item['address'] }}
                                            </div>
                                        </div>

                                        <div class="properties-entry">
                                            <div class="row-box">
                                                {% if item['floor'] != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ img_dir }}icon/ic-floor-black.png"/>
                                                            </span>
                                                            Tầng {{ item['floor'] }}
                                                        </div>
                                                    </div>
                                                {% endif %}

                                                {% if item['total_area'] != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ img_dir }}icon/ic-size-black.png"/>
                                                            </span>
                                                            {{ item['total_area'] }} m<sup>2</sup>
                                                        </div>
                                                    </div>
                                                {% endif %}

                                                {% if item['bedroom_count'] is defined and item['bedroom_count'] != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ img_dir }}icon/ic-bed-black.png"/>
                                                            </span>
                                                            {{ item['bedroom_count'] }} Phòng ngủ
                                                        </div>
                                                    </div>
                                                {% endif %}
                                                <div class="clearfix"></div>

                                                {% if item['direction'] != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ img_dir }}icon/ic-orientation-black.png"/>
                                                            </span>
                                                            {{ item['direction_text'] }}
                                                        </div>
                                                    </div>
                                                {% endif %}

                                                {% if attrView is defined and attrView != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ attrView['image_one_url'] }}"/>
                                                            </span>
                                                            {{ attrView['name'] }}
                                                        </div>
                                                    </div>
                                                {% endif %}

                                                {% if item['bathroom_count'] is defined and item['bathroom_count'] != '' %}
                                                    <div class="col-xs-4">
                                                        <div class="line-icon">
                                                            <span class="icon">
                                                                <img src="{{ img_dir }}icon/ic-bath-black.png"/>
                                                            </span>
                                                            {{ item['bathroom_count'] }} Phòng tắm
                                                        </div>
                                                    </div>
                                                {% endif %}
                                            </div>
                                        </div>

                                        <div class="line-icon line-price">
                                            {{ currencyFormat(item['price']) }} VND
                                        </div>
                                        <a href="{{ url({'for': 'apartment_detail', 'slug': item['slug'], 'id': item['id']}) }}" class="esta-button btn link-type pull-right">
                                            Xem chi tiết
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            {% endfor %}
                        {% endif %}
                    </div>

                    <div class="pagination">
                        {{ paginationLayout }}
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom_js %}
    <script src="/asset/default/search/plugin_search.js"></script>
    <script type="text/javascript">
        var url_save_search = '{{ url({'for': 'user_save_search_ajax'}) }}';
        $(document).ready(function() {

            $('.limit_select').on('click', function() {
                var limit = $(this).attr('data-value');
                var oldLimit = $('#limit').val();

                if (limit != oldLimit) {
                    $('[name="search_limit"]').val(limit);
                    submitFormSearch($);
                }
            });

            $('.sort_select').on('click', function() {
                var sortByPrice = $(this).attr('data-value');
                var oldSortByPrice = $('#sort_by_price').val();

                if (sortByPrice != oldSortByPrice) {
                    $('[name="sort_by_price"]').val(sortByPrice);
                    submitFormSearch($);
                }
            });

            var _searchString = $('#form-search').serialize();
            var dataSearch = $.unserialize(_searchString);
            var flatFilterValue = false;

            $.each(dataSearch, function(i, value) {
                if ($.isArray(value)) {
                    flatFilterValue = true;

                    $.each(value, function(index, _value) {
                        var text = $('[name = "' + i + '[]"][value="' + _value + '"]').closest('label').addClass('a').children('.text').text();
                        var html = '<span class="tag-filter">' + text + '<span data-value="' + _value + '" class="close"></span></span>';
                        $('.filter-selected').append(html);
                    });
                }
            });

            var _clearall = '<a href="{{ url({'for': 'search'}) }}" class="tag-filter clearall">Xóa hết</a>';
            $('.filter-selected').append(_clearall);

            if (!flatFilterValue) {
                $('.filter-selected').html('').css({'padding': '0'}).height(10);
            }

            $('.sub-list [type="checkbox"]').each(function() {
                if ($(this).is(':checked')) {
                    $(this).closest('.sub-list')
                        .parents('li')
                        .addClass('active')
                        .children('.custom-checkbox')
                        .find('[type="checkbox"]')
                        .prop('checked', true);
                }
            });

            $('.basic-search .esta-button').on('click', function(event){
                event.preventDefault();
                submitFormSearch($);
            });

            $smsChecked = $('.smartsearch [type="radio"]:checked');
            var dataJson = $smsChecked.data('value');
            if (typeof dataJson != 'undefined') {
                $('.filed-hidden-smartsearch').html('');
                $.each(dataJson, function(index, value){
                    $('.filed-hidden-smartsearch').append('<input name="'+ index +'" value="'+ value +'" type="hidden"/>')
                });
            }

            $('.smartsearch input:checked').on('click', function(){
                $this = $(this);
                $(this).prop('checked', false);
                $('[name="cid"]').val('');

                submitFormSearch($);
            });

            $('.smartsearch [type="radio"]').on('change', function(){

                $this = $(this);
                var dataJson = $this.data('value');
                $('.filed-hidden-smartsearch').html('');
                $.each(dataJson, function(index, value){
                    $('.filed-hidden-smartsearch').append('<input name="'+ index +'" value="'+ value +'" type="hidden"/>')
                });

                $('.filter-multiple input[type = "checkbox"]').prop('checked', false);
                submitFormSearch($);

            });

        }).on('change', '.form-search [type="checkbox"]', function() {
            submitFormSearch($);
        }).on('click', '#save-search', function (event) {
            event.preventDefault();
            var url = window.location.href;

            $.ajax({
                'url' : url_save_search,
                'data' : { url_search: url},
                'type' : 'GET',
                success: function (response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                            var html = '<div class="alert alert-success">Lưu kết quả tìm kiếm thành công</div>';
                            $('#mess-save-search').html(html)

                        } else {
                            if ( $('#link-login').size() > 0 ) {
                                $('#link-login').trigger('click');
                            } else {
                                var html = '<div class="alert alert-error">Kết quả tìm kiếm chưa được lưu. Vui lòng thử lại.</div>';
                                $('#mess-save-search').html(html)
                            }
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }

                }
            });
        }).on('click', '.tag-filter .close', function() {

            $('.smartsearch').find('input').each(function(){
                if($(this).is(':checked')) {
                    $(this).prop('checked', false);
                }
            });
            $('[name="cid"]').val('');

            var value = $(this).data('value');
            $('[value="' + value + '"]').prop('checked', false);
            $('[value="' + value + '"]').val('');
            $(this).closest('.tag-filter').fadeOut('fast');

            submitFormSearch($);
        });

        function submitFormSearch($){
            var dataGetUrl = $('#form-search').serialize();
            $.ajax({
                url: '{{ url({'for': 'getLinkSearch'}) }}',
                data: dataGetUrl,
                dataType: 'json',
                success: function(data){
                    if (data.status == 200) {
                        window.location.href = data.result
                    }
                }
            })
        }
    </script>
{% endblock %}
