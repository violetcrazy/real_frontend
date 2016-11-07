{% extends 'default_apartment.volt' %}

{% block title %}{{ apartment['name'] ~ ' - ' ~ apartment['block_name'] ~ ' - ' ~ apartment['project_name'] }}{% endblock %}
{% block description %}{{ apartment['name'] }}{% endblock %}
{% block keywords %}{{ apartment['name'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" />

    <meta property="fb:app_id" content="665201730210206" />
    <meta name="author" content=": (08) 6689 3838 - JINN" />
    <meta property="og:locale" content="vi_VN" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{ apartment['name'] }}" />
    <meta property="og:description" content="{{ apartment['description'] }}" />
    <meta property="og:url" content="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" />
    <meta property="og:site_name" content="jinn.vn" />
    <meta property="og:image" content="{{ apartment['default_image_url'] }}" />
{% endblock %}

{% block breadcrumbs %}
    {% include "default/element/breadcrumbs.volt" %}
{% endblock %}

{% block content %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

    <div class="container">
        <h2 class="title-block title-page">{{ apartment['name'] }}</h2>
        <div class="row">
            <div class="col-xs-9">
                <div class="block-view-map">
                    <div class="header">
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=1' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 1 or request.getQuery('type') == null ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/{{ request.getQuery('type') == 1 ? 'ic_3D furniture_red_20px-01.png' : 'ic_3D Furniture_20px.png' }}">
                            </span>
                            <b>Nội thất 3D</b>
                        </a>
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=2' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 2 ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/{{ request.getQuery('type') == 2 ? 'ic_building map_red_20px-03.png' : 'ic_building map_20px-03.png' }}">
                            </span><b>Hình tổng thể</b>
                        </a>
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=3' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 3 ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/{{ request.getQuery('type') == 3 ? 'ic_plan view_red_20px-02.png' : 'ic_Plan View_20px.png' }}">
                            </span>
                            <b>Mặt bằng</b>
                        </a>
                        <div class="clearfix"></div>
                    </div>

                    <div class="body-slider">
                        <div class="apartment-slider">
                            <div class="wrap-slider-big">
                                <div class="price">{{ currencyFormat(apartment['price']) }} VND</div>

                                {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                    {% if apartment['furniture_name'] is not empty %}
                                        <div class="caption">
                                            <div class="pull-left">
                                                {#
                                                {% if apartment['images'][4] is defined and apartment['images'][4]|length %}
                                                    {% set i = 0 %}
                                                    {% for album in apartment['images'][4] %}
                                                        <label data-id="{{ album['id']}}" data-aid="{{ apartment['id']}}" data-url="{{ url({'for': 'load_gallery_ajax'}) }}"  id="modern" class="line {% if i == 0 %}active{% endif %}">
                                                            <span class="mark"></span>
                                                            <span class="price-item">{{ album['name']}} - {{ album['price']}} VND</span>
                                                        </label>
                                                    {% set i = i + 1 %}
                                                    {% endfor %}
                                                {% endif %}
                                                #}
                                            </div>

                                                <div class="pull-right">
                                                    <div class="info-contact">
                                                        <div class="image-logo"><img src="{{ apartment['furniture_logo'] is defined ? config.cdn.dir_upload ~ apartment['furniture_logo'] : 'http://placehold.it/80'}}"></div>
                                                        <div class="info">
                                                            <p class="text">Furnished by <br><b>{{ apartment['furniture_name'] }}</b></p>
                                                            <a data-toggle="modal"
                                                            data-target="#contact-furniture"
                                                            aria-hidden="true" data-dismiss="modal"
                                                            class="btn popup-contact-furniture" style="padding: 0px">
                                                                Click here to contact >>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                            <div class="clearfix"></div>
                                        </div>
                                    {% endif %}
                                {% endif %}

                                <div id="slider" class="flexslider">
                                    <ul class="slides">
                                        {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                            {% if apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')] is defined and  apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')]| length %}
                                                {% for g in apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')] %}
                                                    <li>
                                                        <span class="entry">
                                                            <img src="{{ config.cdn.dir_upload ~ g['image'] }}">
                                                        </span>
                                                    </li>
                                                {% endfor %}
                                            {% endif %}
                                        {% endif %}
                                        {% if (request.getQuery('type') == 2) %}
                                            <li>
                                                <span class="entry">
                                                    <img src="{{ config.cdn.dir_upload ~ apartment['default_image'] }}">
                                                </span>
                                            </li>
                                        {% endif %}

                                        {% if (request.getQuery('type') == 3) %}
                                            {% if apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')] is defined and  apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')]| length %}
                                                {% for g in apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')] %}
                                                    <li>
                                                        <span class="entry">
                                                            <img src="{{ config.cdn.dir_upload ~ g['image'] }}">
                                                        </span>
                                                    </li>
                                                {% endfor %}
                                            {% endif %}
                                        {% endif %}
                                    </ul>
                                </div>
                            </div>
                            <div id="carousel" class="flexslider">
                                <ul class="slides">

                                    {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                        {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                            {% if apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')] is defined and  apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')]| length %}
                                                {% for g in apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_3D')] %}
                                                    <li>
                                                        <span class="entry">
                                                            <img src="{{ config.cdn.dir_upload ~ g['image'] }}">
                                                        </span>
                                                    </li>
                                                {% endfor %}
                                            {% endif %}
                                        {% endif %}
                                    {% endif %}

                                    {% if (request.getQuery('type') == 3) %}
                                        {% if apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')] is defined and  apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')]| length %}
                                            {% for g in apartment['images'][constant('\ITECH\Data\Lib\Constant::MAP_IMAGE_TYPE_GALLERY')] %}
                                                <li>
                                                    <span class="entry">
                                                        <img src="{{ config.cdn.dir_upload ~ g['image'] }}">
                                                    </span>
                                                </li>
                                            {% endfor %}
                                        {% endif %}
                                    {% endif %}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="apartment-detail">
                    <div class="share-tool">
                        <span class="text">Chia sẻ: </span>

                        <a href="https://plus.google.com/share?url={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                            <img src="{{ config.asset.frontend_url }}google.png">
                        </a>

                        <a href="https://www.facebook.com/sharer/sharer.php?u={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                            <img src="{{ config.asset.frontend_url }}facebook.png">
                        </a>

                        <a href="https://twitter.com/home?status={{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" class="item-share">
                            <img src="{{ config.asset.frontend_url }}twitter.png">
                        </a>

                        {% if apartment['condition'] == constant('\ITECH\Data\Lib\Constant::APARTMENT_CONDITION_AVAILABLE') and apartment['type'] == constant('\ITECH\Data\Lib\Constant::APARTMENT_TYPE_BUY') %}
                            {% if userSession is defined and apartment['agent']['id'] is defined and userSession['id'] == apartment['agent']['id'] %}
                                <div class="action-right">
                                    <a href="#form-request" class="btn esta-button run-fancybox">Gửi yêu cầu</a>
                                    {#<a class="btn esta-button dis">Phương thức thanh toán</a>#}
                                </div>
                            {% endif %}
                        {% endif %}
                    </div>

                    <!-- <div class="info-request">Requested on 23/12/2013, 12:03 pm</div> -->

                    {% if apartment['panorama_view_url'] is defined and apartment['panorama_view_url'] != '' %}
                        <div class="tools-view-panorama">
                            <div class="entry">
                                <img src="{{ apartment['panorama_view_url'] }}">
                                <div class="caption">Xem Panorama</div>
                            </div>
                        </div>
                    {% endif %}

                    {% set getTrend = getTrend() %}
                    <div class="row title-block-apartment">
                        <img style="margin-right: 5px" src="{{ img_dir }}overview.png" alt="">
                        Tổng quan</div>
                    <div class="entry-content">
                        <div class="description f16">
                            <div class="short"> {{ niceWordsByChars(apartment['description'], 200) }}...</div>
                            <div class="long">
                                {{ apartment['description'] }}
                            </div>
                            <div class="more-link"><a class="link">[+ Xem thêm]</a></div>
                        </div>
                    </div>

                    <div class="row title-block-apartment">
                        <img style="margin-right: 5px" src="{{ img_dir }}type.png" alt="">
                        Các kiểu căn hộ</div>
                    <div class="entry-content">
                        <div class="row layout-3 f16">
                            {% if apartment['attributes']['type'] is defined and apartment['attributes']['type']|length %}
                                {% for item in apartment['attributes']['type'] %}
                                    <div class="col-xs-4">
                                        <b class="text block inner--5">
                                            {{ item['name'] }}
                                        </b>
                                    </div>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>
                    <div class="row title-block-apartment">
                        <img style="margin-right: 5px" src="{{ img_dir }}evn.png" alt="">
                        Môi trường sống</div>
                    <div class="entry-content f16">
                        <div class="row layout-3">
                            <div class="col-xs-6">
                                <div class="text block inner--5">
                                    <b>Diện tích: {{ currencyFormat(apartment['total_area']) }} ha</b>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="text block inner--5">
                                    Hướng nhìn:
                                    {% if apartment['attributes']['view'] is defined and apartment['attributes']['view']|length %}
                                        {% for item in apartment['attributes']['view'] %}
                                            <b>{{ item['name'] }},</b>
                                        {% endfor %}
                                    {% endif %}
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="text block inner--5">
                                    <b>Hướng: {{ apartment['direction_text'] }}</b>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="text block inner--5">
                                    <b>Diện tích cây xanh: {{ currencyFormat(apartment['green_area']) }} m<sup>2</sup></b>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row title-block-apartment">
                        <img style="margin-right: 5px" src="{{ img_dir }}uti.png" alt="">
                        Tiện ích</div>
                    <div class="entry-content f16">
                        <div class="row layout-3">
                            {% if apartment['attributes']['utility'] is defined and apartment['attributes']['utility']|length %}
                                {% for item in apartment['attributes']['utility'] %}
                                    <div class="col-xs-4">
                                        <b class="text block inner--5">
                                            {{ item['name'] }}
                                        </b>
                                    </div>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>

                    <div class="title-block-apartment m-t-30">Vị trí</div>
                    <div class="entry-position f16">
                        <p>{{ apartment['position']['description'] }}</p><br>
                        <img src="{{ apartment['position']['image'] }}">
                    </div>

                    {% if apartment['agent'] is defined and apartment['agent']['id'] is defined %}
                        {% if (userSession is not defined) or (userSession is defined and userSession['id'] != apartment['agent']['id']) %}
                            <form class="form-send-agent" id="send_mail_contact">
                                <div class="title-form">Gửi tin nhắn cho người quản lý căn hộ</div>
                                <input type="hidden" id="user_id" name="id" value="{{ apartment['agent']['id'] }}">
                                <input type="hidden" id="created_by" value="{{ userSession is defined ? userSession['id'] : '' }}" name="created_by">

                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <div class="text">Họ và tên</div>
                                            <div class="imput">
                                                <input type="text" id="name" name='name' value="{{ userSession is defined ? userSession['name'] : '' }}" placeholder="Nhập họ tên" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <div class="text">Số điện thoại</div>
                                            <div class="imput">
                                                <input type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone" placeholder="Nhập số điện thoại" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <div class="text">Email</div>
                                            <div class="imput">
                                                <input type="email" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email" placeholder="Nhập email" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="textarea">
                                    <div class="text">Nội dung</div>
                                    <textarea name="content" rows="5" placeholder="Nhập nội dung" class="form-control"></textarea>
                                </div>
                                <div class="text-center action-bar">
                                    <button type="submit" class="btn esta-button">Gửi</button>
                                    <button type="reset" class="btn esta-button dis">Hủy</button>
                                </div>
                            </form>
                        {% endif %}
                    {% endif %}
                </div>
            </div>

            <div class="col-xs-3">
                <div class="entry-sidebar">
                    {% if apartment['agent'] is defined and apartment['agent'] is not empty %}
                        <h3 class="title-style1">Đại lý</h3>
                        <div class="content-block">
                            <div class="avatar">
                                <img src="{{ apartment['agent']['avatar'] is not empty ? apartment['agent']['avatar'] : config.asset.frontend_url ~ 'img/noimage.jpg' }}">
                            </div>
                            <div class="username">
                                {{ apartment['agent']['name'] is defined ? apartment['agent']['name'] : '' }}
                            </div>
                            <div class="intro-agent">
                                <div class="line-icon">
                                    <span class="icon">
                                        <img src="{{ config.asset.frontend_url }}icon/ic-mail.png">
                                    </span>
                                    {{ apartment['agent']['email'] is defined ? apartment['agent']['email'] : '' }}
                                </div>
                                <div class="line-icon">
                                    <span class="icon">
                                        <img src="{{ config.asset.frontend_url }}icon/ic-phone.png">
                                    </span>
                                    {{ apartment['agent']['phone'] is defined ? apartment['agent']['phone'] : '' }}
                                </div>
                            </div>
                            <div class="summary-user">
                                <div class="title">{{ apartment['agent']['experience'] is defined ? apartment['agent']['experience'] : '' }}</div>
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
                                        <div class="more-link"><a class="link">[+ Xem thêm]</a></div>
                                    {% endif %}
                                </div>
                            </div>
                            <div class="action-bottom">
                                <a id="contact-agent" class="link-action esta-button btn">
                                    Liên hệ
                                </a>
                            </div>
                        </div>
                    {% endif %}

                    <div class="block-fungshei">
                        <form class="box-widget">
                            <h3 class="title-widget">Phong thủy</h3>
                            <div class="content-widget">
                                <div class="group-form">
                                    <div class="dropdown custom-select">
                                        {% set ArticleFengShuiType = getArticleFengShuiType() %}
                                        <input type="hidden" id="gender" value="" name="gender">
                                        <button type="button" id="gender" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Giới tính</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu" id="gender-fungshei">
                                            {% for index, item in ArticleFengShuiType %}
                                                <li><a href="" data-value="{{ index }}">{{ item }}</a></li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                </div>

                                <div class="group-form">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="category_id" name="category_id">
                                        <button type="button" id="year" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                            <span class="text">Năm sinh</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu" id="year-fungshei">
                                            {% if fungshei is defined and fungshei['result']|length %}
                                                {% for item in fungshei['result'] %}
                                                    <li><a href="" data-value="{{ item['id'] }}">{{ item['name'] }} ({{ item['middle_name'] }})</a></li>
                                                {% endfor %}
                                            {% endif %}

                                        </ul>
                                    </div>
                                </div>

                                <div class="group-form">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="mounth-fungshei-value">
                                        <button type="button" id="year" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                            <span class="text">Tháng</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu" id="mounth-fungshei">
                                        </ul>
                                    </div>
                                </div>

                                <div class="text-center group-form">
                                    <button class="btn esta-button" id="view-result">Kết quả</button>
                                </div>
                                <div class="error"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="contact-furniture" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
            <div role="document" class="modal-dialog">
                <div style="width: 650px" class="modal-content">
                    <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

                    <div class="modal-body">
                        <h3 class="title-model">Liên hệ với nội thất</h3>

                        <form class="form-horizontal custom-from" id="send_mail_contact_furniture">

                            <div class="row">
                                <div class="col-xs-12" style="padding-bottom: 5px;">
                                    <div class="input-contact">
                                        <div class="text-label">Email</div>
                                        <input placeholder="Nhập email" type="text" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email-furniture" class="form-control" />
                                        <input type="hidden" name="email-to" value="{{ apartment['furniture_email'] is defined ? apartment['furniture_email'] : '' }}" />
                                        <input type="hidden" name="language" value="{{ language }}" />
                                    </div>
                                </div>
                                </br>
                                <div class="col-xs-6">
                                    <div class="input-contact">
                                        <div class="text-label">Tên</div>
                                        <input placeholder="Nhập tên" type="text" name="name" value="{{ userSession is defined ? userSession['name'] : '' }}" id="name-furniture" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="input-contact">
                                        <div class="text-label">Điện thoại</div>
                                        <input placeholder="Nhập số điện thoại" type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone-furniture" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="m-t-15">
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
        </div>

        <div class="no-display">
            <form action="" method="POST" id="form-request" class="form-custom">
                <div class="popup-inner">
                    <h3 class="title-popup">Thông tin khách hàng</h3>

                    <div id="form-request-error-message" class="alert alert-danger" style="display: none;"></div>
                    <div id="form-request-success-message" class="alert alert-success" style="display: none;"></div>

                    <div class="wrap-row">
                        <div class="row">
                            <div class="col-xs-4">
                                <label for="">Họ và tên</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-name" name="name" placeholder="Nhập họ và tên" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <label for="">Số điện thoại</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-phone" name="phone" placeholder="Nhập số điện thoại" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <label for="">Email</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-email" name="email" placeholder="Nhập email" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="m-t-15">
                        <label for="">Ghi chú</label>
                        <div class="inpu-line">
                            <textarea id="form-request-description" name="description" placeholder="Ghi chú" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="title-row">Phương thức thanh toán</div>
                    <div class="wrap-row">
                        <div class="row">
                            <div class="col-xs-4">
                                <label for="method-full" class="custom-checkbox">
                                    <input type="radio" name="pay_method" value="1" id="method-full" checked="checked" />
                                    <span class="mark"></span>
                                    <span class="text">100%</span>
                                </label>
                            </div>
                            <div class="col-xs-4">
                                <label for="method-persent" class="custom-checkbox">
                                    <input type="radio" name="pay_method" value="2" id="method-persent" />
                                    <span class="mark"></span>
                                    <span class="text">Theo tiến độ</span>
                                </label>
                            </div>
                            <div class="col-xs-4">
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
                </div>

                <input type="hidden" name="agent_id" value="{{ userSession['id'] }}" />
                <input type="hidden" name="apartment_id" value="{{ apartment['id'] }}" />
            </form>
        </div>
        <script>
            $(document).ready(function() {
                var process = false;

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

                $('#send_mail_contact').submit(function(event) {
                   event.preventDefault();
                   var data = $(this).serialize();
                   $this = $(this);

                   $.ajax({
                       url: '{{ url({ 'for' : 'send_message_ajax' }) }}',
                       data: data,
                       type: 'post',
                       dataType: 'json',
                       success: function(response) {
                            if (typeof response != "undefined") {
                                if (response.status == 200) {
                                    var html = '\
                                            <div class="intro-form text-center">\
                                                <h3 class="title-center"> Thành công! </h3>\
                                                <div class="text-intro"> Bạn đã liên hệ thành công đại lý này. </div>\
                                            </div>';
                                    $this.html(html);
                                } else {
                                    var html = '\
                                            <div class="intro-form text-center alert alert-danger">\
                                                <div class="text-intro"> Gửi tin nhắn không thành công, vui lòng điền đầy đủ thông tin. </div>\
                                            </div>';
                                    $this.find('.title-form').after(html);

                                    setTimeout(function() {
                                        $this.find('.alert').fadeOut('fast', function() {
                                            $(this).remove();
                                        });
                                    }, 2000);
                                }
                            } else {
                                alert('An unknown error occurred, please try again.');
                           }
                        }
                    });
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

                $('#year-fungshei a').click(function(){
                    $this = $(this);
                    var id = $this.data('value');
                    $.ajax({
                        url: '{{ url({'for': 'ajax_center'}) }}',
                        data: {
                            action: 'listFungshei',
                            category_id: id,
                            type: $.trim($('#gender').val())
                        },
                        type: 'post',
                        dataType: 'json',
                        success: function(data){
                            if (data.status == 200) {
                                var html = '';
                                $.each(data.result, function(index, value){
                                    html += '<li> <a data-value="'+ value.id +'" >'+ value.name + ' (' + value.intro +')</a></li>'
                                });
                                $('#mounth-fungshei').html(html);
                                $('#mounth-fungshei').prev('button').find('.text').text('Tháng');
                            }
                        }
                    })
                });

                $('#gender-fungshei a').click(function(){
                    setTimeout(function(){
                        $this = $(this);
                        var id = $this.data('value');
                        $.ajax({
                            url: '{{ url({'for': 'ajax_center'}) }}',
                            data: {
                                action: 'listFungshei',
                                category_id: $.trim($('#category_id').val()),
                                type: $.trim($('#gender').val())
                            },
                            type: 'post',
                            dataType: 'json',
                            success: function(data){
                                if (data.status == 200) {
                                    var html = '';
                                    $.each(data.result, function(index, value){
                                        html += '<li> <a data-value="'+ value.id +'" >'+ value.name + ' (' + value.intro +')</a></li>'
                                    });
                                    $('#mounth-fungshei').html(html);
                                    $('#mounth-fungshei').prev('button').find('.text').text('Tháng');
                                    $('#mounth-fungshei-value').val('');
                                }
                            }
                        })
                    }, 100)
                });

                $('#view-result').click(function(event){
                    event.preventDefault();
                    var id = $('#mounth-fungshei-value').val();
                    if (id == "" || typeof id == 'undefined') {
                        $('.block-fungshei .error').html('<div class="text-center group-form text-danger"><i>Vui lòng chọn tháng</i></div>');
                    }
                    $.ajax({
                        url: '{{ url({'for': 'ajax_center'}) }}',
                        data: {
                            action: 'fungsheiDetail',
                            id: id
                        },
                        type: 'post',
                        dataType: 'json',
                        success: function(data){
                            if (data.status == 200) {
                                var content = data.result.description;
                                var html = '' +
                                        '<div style="width: 700px;" class="inner-popup">' +
                                        '<h3 class="title-popup">PHONG THỦY</h3>'
                                         + content +
                                        '</div>';

                                $.fancybox.open({
                                    content: html
                                })
                            }
                        }
                    });
                });
            });
        </script>
        <div class="clearfix"></div>
        {{ relatedLayout }}
    </div>
{% endblock %}

{% block bottom_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.application.base_url ~ 'asset/default/home/js/apartment.js?' ~ config.asset.version }}"></script>
{%  endblock %}
