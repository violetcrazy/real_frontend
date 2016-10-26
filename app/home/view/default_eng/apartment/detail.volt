{% extends 'default_apartment.volt' %}

{% block title %}{{ apartment['name_eng'] ~ ' - ' ~ apartment['block_name_eng'] ~ ' - ' ~ apartment['project_name_eng'] }}{% endblock %}
{% block description %}{{ apartment['name_eng'] }}{% endblock %}
{% block keywords %}{{ apartment['name_eng'] }}{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}" />

    <meta property="fb:app_id" content="665201730210206"/>
    <meta name="author" content=": (08) 6689 3838 - JINN"/>
    <meta property="og:locale" content="vi_VN"/>
    <meta property="og:type" content="website"/>
    <meta property="og:title" content="{{ apartment['name'] }}"/>
    <meta property="og:description" content="{{ apartment['description'] }}"/>
    <meta property="og:url" content="{{ url({'for': 'apartment_detail', 'slug': apartment['slug'], 'id': apartment['id']}) }}"/>
    <meta property="og:site_name" content="jinn.vn"/>
    <meta property="og:image" content="{{ apartment['default_image_url'] }}"/>

{% endblock %}

{% block breadcrumbs %}
    {% include "default_eng/element/breadcrumbs.volt" %}
{% endblock %}

{% block content %}
    <div class="container">
        <h2 class="title-block title-page">{{ apartment['name'] }}</h2>
        <div class="row">
            <div class="col-xs-9">
                <div class="block-view-map">
                    <div class="header">
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=1' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 1 or request.getQuery('type') == null ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/ic_3D furniture_red_20px-01.png">
                            </span>
                            <b>3D Furniture</b>
                        </a>
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=2' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 2 ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/ic_building map_20px-03.png">
                            </span><b>Building view</b>
                        </a>
                        <a href="{{ url({'for': 'apartment_detail', 'id': apartment['id'], 'slug': apartment['slug'], 'query': '?type=3' }) }}" class="line-icon pull-left {{ request.getQuery('type') == 3 ? 'active' : '' }}">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Plan View_20px.png">
                            </span>
                            <b>Plan map</b>
                        </a>
                        <div class="clearfix"></div>
                    </div>

                    <div class="body-slider">
                        <div class="apartment-slider">
                            <div class="wrap-slider-big">

                                <div class="price">$ {{ currencyFormat(apartment['price_eng']) }}</div>

                                {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                    <div class="caption">
                                        <div class="pull-left">
                                            {% if albums is defined and albums|length %}
                                                {% set i = 0 %}
                                                {% for album in albums %}
                                                    <label data-id="{{ album['id']}}" data-aid="{{ apartment['id']}}" data-url="{{ url({'for': 'load_gallery_ajax'}) }}" class="check-album line {% if i == 0 %}active{% endif %}">
                                                        <span class="text">{{ album['name']}}</span>
                                                        <span class="mark"></span>
                                                        <span class="price-item">{{ album['price']}}</span>
                                                    </label>
                                                {% set i = i + 1 %}
                                                {% endfor %}
                                            {% endif %}
                                        </div>
                                        {% if apartment['furniture_name_eng'] is not empty %}
                                        <div class="pull-right">
                                            <div class="info-contact">
                                                <div class="image-logo"><img src="{{ apartment['furniture_logo'] is defined ? config.cdn.dir_upload ~ apartment['furniture_logo'] : 'http://placehold.it/80'}}"></div>
                                                <div class="info">
                                                        <p class="text">Furnished by <br><b>{{ apartment['furniture_name_eng'] }}</b></p>
                                                        <a data-toggle="modal"
                                                        data-target="#contact-furniture"
                                                        aria-hidden="true" data-dismiss="modal"
                                                        class="btn popup-contact-furniture" style="padding: 0px">
                                                            Click here to contact >>
                                                        </a>
                                                    </div>
                                            </div>
                                        </div>
                                        {% endif %}
                                        <div class="clearfix"></div>
                                    </div>
                                {% endif %}

                                <div id="slider" class="flexslider">
                                    <ul class="slides">
                                        {% if (request.getQuery('type') == 1 or request.getQuery('type') == null) %}
                                            {% if albums is defined and albums|length %}
                                                {% set i = 0 %}
                                                {% for album in albums %}
                                                    {% if i == 0 and album['gallery'] is defined and  album['gallery']| length %}
                                                        {% for g in album['gallery'] %}
                                                            <li>
                                                                <span class="entry">
                                                                    <img src="{{ g['image_url'] }}">
                                                                </span>
                                                            </li>
                                                        {% endfor %}
                                                    {% endif %}
                                                {% set i = i + 1 %}
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
                                            {% if (apartment['gallery'] is defined and apartment['gallery']|length > 0) %}
                                                {% for image in  apartment['gallery']%}
                                                    <li>
                                                        <span class="entry">
                                                            <img src="{{ config.cdn.dir_upload ~ image }}">
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
                                        {% if albums is defined and albums|length %}
                                            {% set i = 0 %}
                                            {% for album in albums %}
                                                {% if i == 0 and album['gallery'] is defined and  album['gallery']|length %}
                                                    {% for g in album['gallery'] %}
                                                        <li>
                                                            <span class="entry">
                                                                <img src="{{ g['image_thumbnail_url'] }}">
                                                            </span>
                                                        </li>
                                                    {% endfor %}
                                                {% endif %}
                                                {% set i = i + 1 %}
                                            {% endfor %}
                                        {% endif %}
                                    {% endif %}

                                    {% if (request.getQuery('type') == 3) %}
                                        {% if (apartment['gallery'] is defined and apartment['gallery']|length > 0) %}
                                            {% for image in  apartment['gallery']%}
                                                <li>
                                                    <span class="entry">
                                                        <img src="{{ config.cdn.dir_upload ~ image }}">
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
                        <span class="text">Share: </span>

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
                                    <a href="#form-request" class="btn esta-button run-fancybox">Send request</a>
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
                                <div class="caption">View Panorama</div>
                            </div>
                        </div>
                    {% endif %}
                    <div class="row title-block-apartment">Suitable for</div>
                    <div class="entry-content">
                        <div class="row layout-3">
                            {% if suitableForEng is defined and suitableForEng|length %}
                                {% for item in suitableForEng %}
                                    <div class="col-xs-4">
                                        <div class="line-checkbox checked">
                                            <span class="mark"></span>
                                            <span class="text">
                                                {{ item['name'] }}
                                            </span>
                                        </div>
                                    </div>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>
                    <div class="row title-block-apartment">Best for</div>
                    <div class="entry-content">
                        <div class="row layout-3">
                            {% if bestForEng is defined and bestForEng|length %}
                                {% for item in bestForEng %}
                                    <div class="col-xs-4">
                                        <div class="line-checkbox checked">
                                            <span class="mark"></span>
                                            <span class="text">
                                                {{ item['name'] }}
                                            </span>
                                        </div>
                                    </div>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>

                    {% set getTrend = getTrend() %}
                    <div class="row title-block-apartment">Overview</div>
                    <div class="entry-content">
                        <div class="row layout-3">
                            <div class="col-xs-4">
                                <div class="line-icon p">
                                    <span class="icon">
                                        <img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png">
                                    </span>
                                    {{ getTrend[apartment['trend']] }}
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="line-icon p">
                                    <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-ha.png"></span>
                                    {{ apartment['area'] }} ha
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="line-icon p">
                                    <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-tree.png"></span>
                                    {{ apartment['space'] }} m<sup>2</sup>
                                </div>
                            </div>
                        </div>
                        <div class="description_eng">
                            <div class="short"> {{ niceWordsByChars(apartment['description_eng'], 200) }}...</div>
                            <div class="long">
                                {{ apartment['description_eng'] }}
                            </div>
                            <div class="more-link"><a class="link">[+ Read More]</a></div>
                        </div>
                    </div>

                    <div class="row title-block-apartment">Property Features</div>
                    <div class="entry-content">
                        <div class="row layout-3">
                            {% if apartment['property_utility_eng'] is defined and apartment['property_utility_eng']|length %}
                                {% for item in apartment['property_utility_eng'] %}
                                    <div class="col-xs-4">
                                        <div class="line-icon p">
                                            <span class="icon">
                                                <img src="{{ item['image_two_url'] }}">
                                            </span>
                                            {{ item['name'] }}
                                        </div>
                                    </div>
                                {% endfor %}
                            {% endif %}
                        </div>
                    </div>

                    <div class="title-block-apartment m-t-30">Position</div>
                    <div class="entry-position">
                        <p>{{ apartment['position_description'] }}</p><br>
                        <img src="{{ apartment['position_image_url'] }}">
                    </div>

                    {% if apartment['agent'] is defined and apartment['agent']['id'] is defined %}
                        {% if userSession is not defined or userSession['id'] != apartment['agent']['id'] %}

                        <form class="form-send-agent" id="send_mail_contact">
                            <div class="title-form">Send message to Agent</div>
                            <input type="hidden" id="user_id" name="id" value="{{ apartment['agent']['id'] }}">
                            <input type="hidden" id="created_by" value="{{ userSession is defined ? userSession['id'] : '' }}" name="created_by">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <div class="text">Name</div>
                                        <div class="imput">
                                            <input type="text" id="name" name='name' value="{{ userSession is defined ? userSession['name'] : '' }}" placeholder="Name" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <div class="text">Phone</div>
                                        <div class="imput">
                                            <input type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone" placeholder="Phone" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <div class="text">Email</div>
                                        <div class="imput">
                                            <input type="email" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email" placeholder="Email" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="textarea">
                                <div class="text">Content</div>
                                <textarea name="content" rows="5" placeholder="Content" class="form-control"></textarea>
                            </div>
                            <div class="text-center action-bar">
                                <button type="submit" class="btn esta-button">Send</button>
                                <button type="reset" class="btn esta-button dis">Cancel</button>
                            </div>
                        </form>
                        {% endif %}
                    {% endif %}
                </div>
            </div>
            <div class="col-xs-3">
                <div class="entry-sidebar">
                    {% if apartment['agent'] is defined and apartment['agent'] is not empty %}
                        <h3 class="title-style1">Agent</h3>
                        <div class="content-block">
                            <div class="avatar">
                                <img src="{{ apartment['agent']['avatar'] is not empty ? apartment['agent']['avatar'] : config.asset.frontend_url ~ 'img/noimage.jpg' }}">
                            </div>
                            <div class="username">
                                {{ apartment['agent']['name'] is defined ? apartment['agent']['name'] : '' }}
                                </div>
                            <div class="intro-agent">
                                <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-mail.png"></span>
                                    {{ apartment['agent']['username'] is defined ? apartment['agent']['username'] : '' }}
                                </div>
                                <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-phone.png"></span>
                                    {{ apartment['agent']['phone'] is defined ? apartment['agent']['phone'] : '' }}
                                </div>
                                <!-- <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-home-black.png"></span>
                                    20 Recent Sales
                                </div> -->
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
                                        <div class="more-link"><a class="link">[+ Readmore]</a></div>
                                    {% endif %}
                                </div>
                            </div>
                            <div class="action-bottom">
                                <a id="contact-agent" class="link-action esta-button btn">
                                Contact</a>
                            </div>
                        </div>
                    {% endif %}

                    <div class="block-fungshei">
                        <form class="box-widget">
                            <h3 class="title-widget">Fengshei</h3>
                            <div class="content-widget">
                                <div class="group-form">
                                    <div class="dropdown custom-select">
                                        {% set ArticleFengShuiType = getArticleFengShuiType() %}
                                        <input type="hidden" id="gender" value="" name="gender">
                                        <button type="button" id="gender" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Gender</span><span class="arrow"></span></button>
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
                                            <span class="text">Year</span><span class="arrow"></span></button>
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
                                        <input type="hidden" id="months-fungshei-value">
                                        <button type="button" id="year" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                            <span class="text">Months</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu" id="months-fungshei">
                                        </ul>
                                    </div>
                                </div>

                                <div class="text-center group-form">
                                    <button class="btn esta-button" id="view-result">Result</button>
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
                        <h3 class="title-model">Contact Company</h3>

                        <form class="form-horizontal custom-from" id="send_mail_contact_furniture">

                            <div class="row">
                                <div class="col-xs-12" style="padding-bottom: 5px;">
                                    <div class="input-contact">
                                        <div class="text-label">Email</div>
                                        <input placeholder="Input email" type="text" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email-furniture" class="form-control" />
                                        <input type="hidden" name="email-to" value="{{ apartment['furniture_email'] is defined ? apartment['furniture_email'] : '' }}" />
                                        <input type="hidden" name="language" value="{{ language }}" />
                                    </div>
                                </div>
                                </br>
                                <div class="col-xs-6">
                                    <div class="input-contact">
                                        <div class="text-label">Name</div>
                                        <input placeholder="Input name" type="text" name="name" value="{{ userSession is defined ? userSession['name'] : '' }}" id="name-furniture" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="input-contact">
                                        <div class="text-label">Phone</div>
                                        <input placeholder="Input phone" type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone-furniture" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="m-t-15">
                                <div class="input-contact">
                                    <div class="text-label">Content</div>
                                    <textarea placeholder="Input Content" name="content" rows="5" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="form-group submit-button text-center m-t-20">
                                <button type="submit" class="esta-button btn medium">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="no-display">
            <form action="" method="POST" id="form-request" class="form-custom">
                <div class="popup-inner">
                    <h3 class="title-popup">Info customer</h3>

                    <div id="form-request-error-message" class="alert alert-danger" style="display: none;"></div>
                    <div id="form-request-success-message" class="alert alert-success" style="display: none;"></div>

                    <div class="wrap-row">
                        <div class="row">
                            <div class="col-xs-4">
                                <label for="">Full name</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-name" name="name" placeholder="Full name" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <label for="">Phone</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-phone" name="phone" placeholder="Phone" class="form-control" />
                                </div>
                            </div>

                            <div class="col-xs-4">
                                <label for="">Email</label>
                                <div class="input-line">
                                    <input type="text" id="form-request-email" name="email" placeholder="Email" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="m-t-15">
                        <label for="">Note</label>
                        <div class="inpu-line">
                            <textarea id="form-request-description" name="description" placeholder="Note" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="title-row">Paymethod</div>
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
                        <button type="button" id="send-request-action" class="btn esta-button">Send request</button>
                        &#160
                        <button type="reset" class="btn esta-button dis">Cancel</button>
                    </div>
                </div>

                <input type="hidden" name="agent_id" value="{{ userSession['id'] }}" />
                <input type="hidden" name="apartment_id" value="{{ apartment['id'] }}" />
            </form>
        </div>
        <script>
            $(document).ready(function(){

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

                $('#send_mail_contact').submit(function(event){
                    event.preventDefault();
                    var data = $(this).serialize();
                    $this = $(this);
                    $.ajax({
                        url: '{{ url({ 'for' : 'send_message_ajax' }) }}',
                        data: data,
                        type: 'post',
                        dataType: 'json',
                        success: function(response){
                            if (typeof response != "undefined") {
                                if (response.status == 200) {
                                     var html = '\
                                            <div class="intro-form text-center">\
                                                <h3 class="title-center"> Success! </h3>\
                                                <div class="text-intro"> Bạn đã liên hệ thành công đại lý này. </div>\
                                            </div>';
                                        $this.html(html);
                                } else {
                                    var html = '\
                                            <div class="intro-form text-center alert alert-danger">\
                                                <div class="text-intro"> Message cannot be sent,, Please fill in the blank. </div>\
                                            </div>';
                                        $this.find('.title-form').after(html);

                                        setTimeout(function(){
                                            $this.find('.alert').fadeOut('fast', function(){
                                                $(this).remove();
                                            })
                                        },2000);
                                }
                            } else {
                                alert('An unknown error occurred, please try again.');
                            }
                        }
                    })
                })

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
                                $('#months-fungshei').html(html);
                                $('#months-fungshei').prev('button').find('.text').text('Months');
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
                                    $('#months-fungshei').html(html);
                                    $('#months-fungshei').prev('button').find('.text').text('Months');
                                    $('#months-fungshei-value').val('');
                                }
                            }
                        })
                    }, 100)
                });

                $('#view-result').click(function(event){
                    event.preventDefault();
                    var id = $('#months-fungshei-value').val();
                    if (id == "" || typeof id == 'undefined') {
                        $('.block-fungshei .error').html('<div class="text-center group-form text-danger"><i>Please choose months</i></div>');
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
                                var content = data.result.description_eng;
                                var html = '' +
                                        '<div style="width: 700px;" class="inner-popup">' +
                                        '<h3 class="title-popup">FENGSHEI</h3>'
                                        + content +
                                        '</div>';

                                $.fancybox.open({
                                    content: html
                                })
                            }
                        }
                    })
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
                        success: function(response){
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

                                    setTimeout(function(){
                                        $this.find('.alert').fadeOut('fast', function(){
                                            $(this).remove();
                                        })
                                    },2000);
                                }
                            } else {
                                alert('An unknown error occurred, please try again.');
                            }
                        }
                    })
                })

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
