{% extends 'mobile_template.volt' %}

{% block title %}{{ apartment['name'] ~ ' - ' ~ apartment['block_name'] ~ ' - ' ~ apartment['project_name'] }}{% endblock %}
{% block description %}{{ apartment['name'] }}{% endblock %}
{% block keywords %}{{ apartment['name'] }}{% endblock %}

{% block content %}
    {% set js_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/js/' %}
    {% set img_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/img/' %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'apartment.js?' ~ config.asset.version }}"></script>

    <div class="block-header-tab layout-3">
        <a href="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}?type=1" class="{{ !request.getQuery('type') or request.getQuery('type') == 1 ? 'active' : '' }} item">Nội thất</a>
        <a href="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}?type=2" class="{{ request.getQuery('type') == 2 ? 'active' : '' }} item">Hình ảnh</a>
        <a href="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}?type=3" class="{{ request.getQuery('type') == 3 ? 'active' : '' }} item">Sơ đồ</a>
        <div class="clearfix"></div>
    </div>

    <div class="main-content">

        <h1 class="title-style1 text-center">{{ apartment['name'] }}</h1>
        <div class="slides-apartment custom-swiper row-main">
            <div class="price-main">{{ currencyFormat(apartment['price']) }} VND</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">

                    {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                        {% if albums is defined and albums|length %}
                            {% set i = 0 %}
                            {% for album in albums %}
                                {% if i == 0 and album['gallery'] is defined and  album['gallery']| length %}
                                    {% for g in album['gallery'] %}
                                        <div class="swiper-slide">
                                            <div class="entry">
                                                <div class="thumbnail-custom">
                                                    <div style="background-image: url({{ g['image_url'] }})" class="img"></div>
                                                </div>
                                            </div>
                                        </div>
                                    {% endfor %}
                                {% endif %}
                                {% set i = i + 1 %}
                            {% endfor %}
                        {% endif %}
                    {% endif %}

                    {% if (request.getQuery('type') == 2) %}
                        {% if (apartment['gallery_url'] is defined and apartment['gallery_url']|length > 0) %}
                            {% for image in  apartment['gallery_url']%}
                                <div class="swiper-slide">
                                    <div class="entry">
                                        <div class="thumbnail-custom">
                                            <div style="background-image: url({{ image }})" class="img"></div>
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                        {% endif %}
                    {% endif %}

                    {% if (request.getQuery('type') == 3) %}
                        <div class="swiper-slide">
                            <div class="entry">
                                <div class="thumbnail-custom">
                                    <div style="background-image: url({{ config.cdn.dir_upload ~ apartment['default_image'] }})" class="img"></div>
                                </div>
                            </div>
                        </div>
                    {% endif %}

                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>

            {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                {% if apartment['furniture_name'] is not empty %}
                    <div class="logo-designer">
                        <div class="thumbnail-custom">
                            <div style="background-image: url({{ apartment['furniture_logo'] is defined ? config.cdn.dir_upload ~ apartment['furniture_logo'] : 'http://placehold.it/80'}})" class="img"></div>
                        </div>
                        <div class="summary">Thiết kế bởi <br> <span class="title">{{ apartment['furniture_name'] }} </span></div>
                        <div class="clearfix"></div>
                    </div>
                {% endif %}
            {% endif %}

        </div>

        {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
            <div class="list-gallery">
            {% if albums is defined and albums|length %}
                {% for album in albums %}
                    <a data-id="{{ album['id']}}" data-aid="{{ apartment['id']}}" class="item" data-url="{{ url({'for': 'load_gallery_ajax'}) }}">
                        {{ album['name']}}
                        <span class="price">{{ currencyFormat(album['price']) }} VND</span>
                    </a>
                {% endfor %}
            {% endif %}
            </div>
        {% endif %}

        {% if apartment['panorama_view_url'] is defined and apartment['panorama_view_url'] != '' %}
            <div class="row-main view-panorama">
                <div class="button-navi"><a class="btn-left"></a><a class="btn-right"></a></div>
                <div class="panorama"><img src="{{ apartment['panorama_view_url'] }}" alt=""></div>
            </div>
        {% endif %}

        <div class="share-tool"><span class="text">Share this</span>
            <div class="block-img">
                <a href="https://plus.google.com/share?url={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                    <img src="{{ config.asset.frontend_url }}google.png">
                </a>

                <a href="https://www.facebook.com/sharer/sharer.php?u={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                    <img src="{{ config.asset.frontend_url }}facebook.png">
                </a>

                <a href="https://twitter.com/home?status={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                    <img src="{{ config.asset.frontend_url }}twitter.png">
                </a>
            </div>
        </div>

        <div class="tools-single-apartment">
            {% if apartment['condition'] == constant('\ITECH\Data\Lib\Constant::APARTMENT_CONDITION_AVAILABLE') and apartment['type'] == constant('\ITECH\Data\Lib\Constant::APARTMENT_TYPE_BUY') %}
                {% if userSession is defined and apartment['agent']['id'] is defined and userSession['id'] == apartment['agent']['id'] %}
                    <a href="#form-request" class="esta-button text-center dis block fancybox-run">Gửi yêu cầu</a>
                {% endif %}
            {% endif %}
            <a href="#form-request" class="esta-button text-center dis block fancybox-run">Gửi yêu cầu</a>
        </div>

        {% if suitableFor is defined and suitableFor|length %}
            <h3 class="title-style1 m-t-20">Căn hộ phù hợp với</h3>
            <div class="block-property-single layout-2-col">
            {% for item in suitableFor %}
                <div class="line-icon span m-b-5"><span class="icon-span"></span>{{ item['name'] }}</div>
            {% endfor %}
                <div class="clearfix"></div>
            </div>
        {% endif %}
        <div class="hr"></div>

        {% if bestFor is defined and bestFor|length %}
            <h3 class="title-style1 m-t-20">Mục đích sử dụng tốt với</h3>
            <div class="block-property-single layout-2-col">
            {% for item in bestFor %}
                <div class="line-icon span m-b-5"><span class="icon-span"></span>{{ item['name'] }}</div>
            {% endfor %}
                <div class="clearfix"></div>
            </div>
        {% endif %}
        <div class="hr"></div>

        <h3 class="title-style1">Tổng quan</h3>
        <div class="block-property-single layout-3-col m-t-10">
            {% set getTrend = getTrend() %}
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-size-black.png" alt="" class="icon">{{ apartment['area'] }}m<sup>2</sup></div>
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-floor-black.png" alt="" class="icon">Lầu {{ apartment['floor_count'] }}</div>
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-sea-view-black.png" alt="" class="icon">{{ apartment['property_view'][0] is defined ? apartment['property_view'][0]['name'] : '' }}</div>
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-bed-black.png" alt="" class="icon">{{ apartment['bedroom_count'] }} Phòng ngủ</div>
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-orientation-black.png" alt="" class="icon">{{ getTrend[apartment['trend']] }}</div>
            <div class="line-icon"><img src="{{ img_dir }}data-example/icon/ic-bath-black.png" alt="" class="icon">{{ apartment['bathroom_count'] }} Phòng tắm</div>
            <div class="clearfix"></div>
        </div>

        <div class="description m-t-10">
            <div class="short">{{ niceWordsByChars(apartment['description'], 200) }}...</div>
            <div class="long">
                {{ apartment['description'] }}
            </div>
            <div class="more-link"><a class="link"> [+Xem thêm]</a></div>
        </div>
        <div class="hr"></div>

        <h3 class="title-style1">Tiện ích</h3>
        <div class="block-property-single layout-2-col">
            {% if apartment['property_utility'] is defined and apartment['property_utility']|length %}
                {% for item in apartment['property_utility'] %}
                    <div class="line-icon"><img src="{{ item['image_two_url'] }}" alt="" class="icon">{{ item['name'] }}</div>
                {% endfor %}
            {% endif %}
            <div class="clearfix"></div>
        </div>

        <div class="hr"></div>

        <h3 class="title-style1">Vị trí</h3>
        <div class="des m-b-10"> {{ apartment['postion_description'] is defined and apartment['postion_description'] != '' ? apartment['postion_description'] : '' }} </div>
        <div class="main-image">
            {% if apartment['position_image_url'] is defined and apartment['position_image_url'] != '' %}
                <img src="{{ apartment['position_image_url'] }}" alt="">
            {% endif %}
        </div>

        {% if apartment['agent'] is defined and apartment['agent'] is not empty %}

                <h3 class="title-style1 m-t-15">Thông tin Đại lý</h3>
                <div class="view-agent">
                    <div class="content-block">
                        <div class="avatar">
                            <img src="{{ apartment['agent']['avatar'] is not empty ? apartment['agent']['avatar'] : config.asset.frontend_url ~ 'img/noimage.jpg' }}"></div>
                        <div class="summary">
                            <div class="entry">
                                <div class="username">{{ apartment['agent']['name'] is defined ? apartment['agent']['name'] : '' }}</div>
                                <div class="intro-agent">
                                    <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-mail.png"></span>
                                        {{ apartment['agent']['email'] is defined ? apartment['agent']['email'] : '' }}
                                    </div>
                                    <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-phone.png"></span>
                                        {{ apartment['agent']['phone'] is defined ? apartment['agent']['phone'] : '' }}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="summary-user m-t-10">
                            <div class="title text-danger"><b>{{ apartment['agent']['experience'] is defined ? apartment['agent']['experience'] : '' }}</b></div>
                            <div class="description">
                                <div class="short">
                                    {% if apartment['agent']['description'] is defined %}
                                        {{ niceWordsByChars(apartment['agent']['description'], 50) }}...
                                    {% endif  %}
                                </div>
                                <div class="long">
                                    {{ apartment['agent']['description'] is defined ? apartment['agent']['description'] : '' }}
                                </div>
                                {% if apartment['agent']['description'] is not empty %}
                                    <div class="more-link"><a class="link"> [+Xem thêm]</a></div>
                                {% endif %}
                            </div>
                        </div>
                        <div class="action-bottom m-t-10 m-b-15"><a href="#form-contact" class="fancybox-run link-action esta-button dis block btn-small">Liên hệ</a></div>
                    </div>
                </div>

                <div class="hr"></div>
        {% endif %}

        {{ relatedLayout is defined and relatedLayout != '' ? relatedLayout : '' }}

    </div>

    <div style="display: none;">
        <div id="form-contact">
            <div class="popup-inner">
                <h3 class="title-model">Liên hệ với nội thất</h3>

                <form class="form-horizontal form-custom" id="send_mail_contact_furniture">

                    <div class="input-line">
                        <div class="input-contact">
                            <div class="text-label">Email</div>
                            <input placeholder="Nhập email" type="text" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email-furniture" class="form-control" />
                            <input type="hidden" name="email-to" value="{{ apartment['furniture_email'] is defined ? apartment['furniture_email'] : '' }}" />
                            <input type="hidden" name="language" value="{{ language }}" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-contact">
                            <div class="text-label">Tên</div>
                            <input placeholder="Nhập tên" type="text" name="name" value="{{ userSession is defined ? userSession['name'] : '' }}" id="name-furniture" class="form-control" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-contact">
                            <div class="text-label">Điện thoại</div>
                            <input placeholder="Nhập số điện thoại" type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone-furniture" class="form-control" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-contact">
                            <div class="text-label">Gửi tin nhắn</div>
                            <textarea placeholder="Nhập nội dung" name="content" rows="5" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="form-group submit-button text-center m-t-20">
                        <button type="submit" class="esta-button btn medium">Gửi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div style="display: none;">
        <form action="" method="POST" id="form-request" class="form-custom">
            <div class="popup-inner">
                <h3 class="title-popup">Thông tin khách hàng</h3>

                <div id="form-request-error-message" class="alert alert-danger" style="display: none;"></div>
                <div id="form-request-success-message" class="alert alert-success" style="display: none;"></div>

                <div class="wrap-row">
                    <div class="row">
                        <div class="">
                            <label for="">Họ và tên</label>
                            <div class="input-line">
                                <input type="text" id="form-request-name" name="name" placeholder="Nhập họ và tên" class="form-control" />
                            </div>
                        </div>

                        <div class="">
                            <label for="">Số điện thoại</label>
                            <div class="input-line">
                                <input type="text" id="form-request-phone" name="phone" placeholder="Nhập số điện thoại" class="form-control" />
                            </div>
                        </div>

                        <div class="">
                            <label for="">Email</label>
                            <div class="input-line">
                                <input type="text" id="form-request-email" name="email" placeholder="Nhập email" class="form-control" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="m-t-15">
                    <label for="">Ghi chú</label>
                    <div class="input-line">
                        <textarea id="form-request-description" name="description" placeholder="Ghi chú" class="form-control"></textarea>
                    </div>
                </div>

                <div class="title-row">Phương thức thanh toán</div>
                <div class="wrap-row">
                    <div class="row">
                        <div class="">
                            <label for="method-full" class="custom-checkbox">
                                <input type="radio" name="pay_method" value="1" id="method-full" checked="checked" />
                                <span class="mark"></span>
                                <span class="text">100%</span>
                            </label>
                        </div>
                        <div class="">
                            <label for="method-persent" class="custom-checkbox">
                                <input type="radio" name="pay_method" value="2" id="method-persent" />
                                <span class="mark"></span>
                                <span class="text">Theo tiến độ</span>
                            </label>
                        </div>
                        <div class="">
                            <label for="method-loan" class="custom-checkbox">
                                <input type="radio" name="pay_method" value="3" id="method-loan" />
                                <span class="mark"></span>
                                <span class="text">Vay vốn</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="hr"></div>
                <div class="action-bottom text-center">
                    <button type="button" id="send-request-action" class="btn esta-button">Gửi yêu cầu</button>
                    &#160
                    <button type="reset" class="btn esta-button dis">Hủy</button>
                </div>
                <br>
            </div>

            <input type="hidden" name="agent_id" value="1" />
            <input type="hidden" name="apartment_id" value="23" />
        </form>
    </div>

    <script>
        var process = false;
        $(document).ready(function() {

            $('#form-request #send-request-action').click(function(e) {
                e.preventDefault();

                $('#form-request-error-message').html('').hide();
                $('#form-request-success-message').html('').hide();

                $('#form-request input').each(function() {
                    $(this).closest('div').removeClass('has-error');
                });

                if (!process) {
                    var error = false;
                    var name = $.trim($('#form-request-name').val());
                    var phone = $.trim($('#form-request-phone').val());
                    var email = $.trim($('#form-request-email').val());

                    if (name == '') {
                        $('#form-request-name').closest('div').addClass('has-error');
                        error = true;
                    }

                    if (phone == '') {
                        $('#form-request-phone').closest('div').addClass('has-error');
                        error = true;
                    }

                    if (email == '') {
                        $('#form-request-email').closest('div').addClass('has-error');
                        error = true;
                    }

                    if (error) {
                        $('#form-request-error-message').html('Vui lòng điền thông tin còn thiếu').show();
                        return;
                    }

                    process = true;
                    $.ajax({
                        type: 'POST',
                        url: '{{ url({'for': 'apartment_request', 'slug': apartment['slug'], 'id': apartment['id']}) }}',
                        data: $('#form-request').serialize(),
                        success: function(response) {
                            if (typeof response != 'undefined') {
                                if (response.status == 200) {
                                    $('#form-request-success-message').html(response.message).show();
                                    window.location.reload();
                                } else {
                                    $('#form-request-error-message').html(response.message).show();
                                }
                            } else {
                                alert('An unknown error occurred, please try again.');
                            }
                        }
                    }).done(function() {
                        process = false;
                    });
                }
            });

            $('#send_mail_contact_furniture').submit(function(event){
                event.preventDefault();
                var data = $(this).serialize();
                $this = $(this);
                $.ajax({
                    url: '{{ url({ 'for' : 'send_mail_ajax' }) }}',
                    data: data,
                    type: 'post',
                    dataType: 'json',
                    success: function(response) {
                        if (typeof response != "undefined") {
                            if (response.status == 200) {
                                var html = '\
                                            <div class="intro-form text-center">\
                                                <h3 class="title-center"> Success! </h3>\
                                                <div class="text-intro">' + response.message + '</div>\
                                            </div>';
                                $this.html(html);
                            } else {
                                var html = '\
                                            <div class="intro-form text-center alert alert-danger">\
                                                <div class="text-intro">' + response.message + '</div>\
                                            </div>';
                                $this.find('.title-form').after(html);

                                setTimeout(function () {
                                    $this.find('.alert').fadeOut('fast', function () {
                                        $(this).remove();
                                    })
                                }, 2000);
                            }
                        } else {
                            alert('An unknown error occurred, please try again.');
                        }
                    }
                });
            });

        }).on('click', '.list-gallery a', function() {
            $('.list-gallery a').removeClass('active');
            $(this).addClass('active');
            if (!process) {
                process = true;
                var id = $(this).attr('data-id'),
                    apartment_id = $(this).attr('data-aid'),
                    url = $(this).attr('data-url');

                $('.slides-apartment').height($('.slides-apartment').height()).addClass('loadding');

                $.ajax({
                    'url': url,
                    'type': 'POST',
                    'data': {
                        'id': id,
                        'apartment_id': apartment_id
                    },
                    success: function(data) {
                        $('.slides-apartment').html(data);
                        var mySwiper1 = new Swiper (
                                '.slides-apartment  .swiper-container',
                                {
                                    loop: true,
                                    nextButton: '.slides-apartment .swiper-button-next',
                                    prevButton: '.slides-apartment .swiper-button-prev'
                                }
                        );
                    }
                }).done(function () {
                    process = false;
                });
            }
        });

    </script>
{% endblock %}
