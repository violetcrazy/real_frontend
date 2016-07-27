<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>{% block title %}{% endblock %}</title>
        <meta name="description" content="{% block description %}{% endblock %}" />
        <meta name="keywords" content="{% block keywords %}{% endblock %}" />
        <meta name="robots" content="index, follow" />

        {% include '_mobile_asset.volt' %}

    {% block top_meta %}{% endblock %}
    {% block top_css %}{% endblock %}
    {% block top_js %}{% endblock %}
    </head>
    <body>
        {% set controllerName = router.getControllerName() %}
        {% set actionName = router.getActionName() %}
        <div class="header-site">
            <div class="block-left"></div>
            <div class="block-center">
                <a href="{{ url({"for": "home"}) }}"><img src="{{ config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/img/logo.png' }}" alt=""></a>
            </div>
            <a href="{{ url({'for': 'search'}) }}" class="block-right"></a>
        </div>
        <div class="menu-sidebar">
            <div class="header-menu">
                {#<div class="tool-left"><a href="">Tiếng Anh</a><a href="">Tiếng Việt</a></div>#}
                <a class="btn-close-menu"></a>
            </div>
            <div class="wrap-menu">
                <div class="entry">
                    <ul class="menu-content">
                        {% if userSession is not defined %}
                            <li>
                                <a href="{{ url({'for': 'user_login'}) }}" class="active">
                                    ĐĂNG KÝ / ĐĂNG NHẬP
                                </a>
                            </li>
                        {% else %}
                            {% set controllerName = router.getControllerName() %}
                            {% set actionName = router.getActionName() %}
                            <li class="has-child"><a><span class="icon-esta icon-user"></span>{{ userSession['name'] }}</a>
                                <ul class="sub-menu">
                                    {% if controllerName == 'user' and actionName == 'profile' %}
                                        <li>
                                            <a href="{{ url({'for': 'user_profile'}) }}" class="active">
                                                Thông tin cá nhân
                                            </a>
                                        </li>
                                    {% else %}
                                        <li>
                                            <a href="{{ url({'for': 'user_profile'}) }}">
                                                Thông tin cá nhân
                                            </a>
                                        </li>
                                    {% endif %}
                                    {% if controllerName == 'user' and actionName == 'contact' %}
                                        <li>
                                            <a href="{{ url({'for': 'user_contact'}) }}" class="active">
                                                Danh bạ
                                            </a>
                                        </li>
                                    {% else %}
                                        <li>
                                            <a href="{{ url({'for': 'user_contact'}) }}">
                                                Danh bạ
                                            </a>
                                        </li>
                                    {% endif %}
                                    {% if controllerName == 'user' and actionName == 'message' %}
                                        <li>
                                            <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}" class="active">
                                                Tin nhắn
                                            </a>
                                        </li>
                                    {% else %}
                                        <li>
                                            <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}">
                                                Tin nhắn
                                            </a>
                                        </li>
                                    {% endif %}
                                    {% if controllerName == 'user' and actionName == 'edit' %}
                                        <li>
                                            <a href="{{ url({'for': 'user_edit'}) }}" class="active">
                                                Cài đặt
                                            </a>
                                        </li>
                                    {% else %}
                                        <li>
                                            <a href="{{ url({'for': 'user_edit'}) }}">
                                                Cài đặt
                                            </a>
                                        </li>
                                    {% endif %}
                                </ul>
                            </li>
                        {% endif %}

                        {% if controllerName == 'project' and actionName == 'list' %}
                            <li>
                                <a href="{{ url({'for': 'project_list'}) }}" class="active">
                                    DỰ ÁN
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'project_list'}) }}">
                                    DỰ ÁN
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'apartment' and actionName == 'buy' %}
                            <li>
                                <a href="{{ url({'for': 'apartment_buy'}) }}" class="active">
                                    CẦN BÁN
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'apartment_buy'}) }}">
                                    CẦN BÁN
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'apartment' and actionName == 'rent' %}
                            <li>
                                <a href="{{ url({'for': 'apartment_rent'}) }}" class="active">
                                    CHO THUÊ
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'apartment_rent'}) }}">
                                    CHO THUÊ
                                </a>
                            </li>
                        {% endif %}
                        {% if controllerName == 'article' and actionName == 'listByCategory' %}
                            <li>
                                <a href="{{ url({'for': 'article_list_news'}) }}" class="active">
                                    TIN TỨC
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'article_list_news'}) }}">
                                    TIN TỨC
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'contact' and actionName == 'index' %}
                            <li>
                                <a href="{{ url({'for': 'contact'}) }}" class="active">
                                    LIÊN HỆ
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'contact'}) }}">
                                    LIÊN HỆ
                                </a>
                            </li>
                        {% endif %}
                        {% if userSession is defined %}
                            <li>
                                <a href="{{ url({'for': 'user_logout'}) }}">
                                    ĐĂNG XUẤT
                                </a>
                            </li>
                        {% endif %}
                    </ul>
                </div>
            </div>
        </div>
        {% block content %}{% endblock %}
        {% set img_dir = config.asset.frontend_url ~ 'mobile/version-1.0/template/asset/img/' %}
        <div class="footer-site">
            <div class="entry-footer">
                <div class="address">
                    <div class="entry">
                        {{ options['footer1_vi'] is defined and options['footer1_vi']['value'] is not empty ? options['footer1_vi']['value'] : '' }}
                    </div>
                    <div class="entry">
                        {{ options['footer2_vi'] is defined and options['footer2_vi']['value'] is not empty ? options['footer2_vi']['value'] : '' }}
                    </div>
                    <div class="entry">
                        {{ options['footer3_vi'] is defined and options['footer3_vi']['value'] is not empty ? options['footer3_vi']['value'] : '' }}
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="text-center">
                    <div class="title">FOLLOW US</div>
                    <div class="social">
                        <a href="{{ options['facebook'] is defined ? options['facebook'] : '' }}" class="facebook"><img src="{{ img_dir }}icon/ic-facebook-w.png"></a>
                        <a href="{{ options['google_plus'] is defined ? options['google_plus'] : '' }}" class="google"><img src="{{ img_dir }}icon/ic-google-w.png"></a>
                        <a href="{{ options['twitter'] is defined ? options['twitter'] : '' }}" class="twiter"><img src="{{ img_dir }}icon/ic-twitter-w.png""></a>
                    </div>
                    <div class="text-mh text-center">
                        <a href="{{ config.application.minhhung_link }}" target="_blank">
                            <img src="{{ config.asset.frontend_url }}img/logo-white.png" alt="">,
                            Một sản phẩm của <b>Minh Hưng Land</b>
                        </a>
                        <span class="line-bottom"></span>
                    </div>
                    <div class="copyright">Copyright JINN 2015 All Rights Reserved</div>
                </div>
            </div>
        </div>
    </body>
</html>
