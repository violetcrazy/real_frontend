{% extends 'default_home.volt' %}

{% block title %}Tin nhắn{% endblock %}
{% block description %}Tin nhắn{% endblock %}
{% block keywords %}Tin nhắn{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}" />
{% endblock %}

{% block content %}
    {% set userName = router.getControllerName() %}
    {% set userAction = router.getActionName() %}
    <div class="container m-t-30 m-b-30">
        <div class="row">
            <div class="col-xs-3">
                <div class="entry-sidebar">
                    <div class="content-block sidebar-user">
                        <div class="avatar">
                            {% if user['avatar'] is not empty %}
                                {% set avatar = user['avatar'] %}
                            {% else %}
                                {% set avatar = config.asset.frontend_url ~ 'img/noimage.jpg' %}
                            {% endif %}
                            <img src="{{ avatar }}">
                        </div>
                        <div class="username">{{ user['firstname'] ~ ' ' ~ user['name']}}</div>
                        <div class="type-user">{% if(user['type'] == 2) %} Agent {% else %} User {% endif %}</div>
                        <ul class="menu-user list-unstyled">
                            {% include 'default/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">THÀNH VIÊN</a><span class="symbol">></span><a href="" class="current">TIN NHẮN</a>
                    </div>
                </div>
                <h1 class="title-block">TIN NHẮN</h1>
                <div class="tools-mess m-b-40">
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}" class="line-icon pull-left {{ filter == 'inbox' ? 'active' : ''  }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-inbox.png" alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-inbox.png" alt="" class="tranparents">
                        Inbox ({{ countMessage }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'send'}) }) }}" class="line-icon pull-left {{ filter == 'send' ? 'active' : ''  }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-send.png" alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-send.png" alt="" class="tranparents">
                        Sent ({{ countMessageSend }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'trash'}) }) }}" class="line-icon pull-left {{ filter == 'trash' ? 'active' : ''  }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-trash.png" alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-trash.png" alt="" class="tranparents">
                        Trash ({{ countMessageTrash }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'delete'}) }) }}" class="line-icon pull-left {{ filter == 'delete' ? 'active' : ''  }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-del.png" alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-del.png" alt="" class="tranparents">
                            Delete ({{ countMessageDelete }})
                    </a>
                    <a href="{{ url({ 'for' : 'user_edit' }) }}" class="line-icon pull-right">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-setting.png" alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-setting.png" alt="" class="tranparents">
                        Cài đặt
                    </a>
                    <div class="clearfix"></div>
                </div>
                <div class="table-messages">
                    <table>
                        {% if listMessage is not empty %}
                            {% for item in listMessage['items'] %}
                                {% if item['read'] == 1 and filter == 'inbox' %}
                                    {% set class = 'read' %}
                                {% else %}
                                    {% set class = '' %}
                                {% endif %}
                                <tr class="{{ class }}">
                                    <td width="50px">
                                        <label for="check{{item['message_id']}}" class="custom-checkbox">
                                            <input type="checkbox" name="check{{item['message_id']}}" id="check{{item['message_id']}}"/>
                                            <span class="mark"></span>
                                            <span class="text"></span>
                                        </label>
                                    </td>
                                    <td>{{item['name']}}</td>
                                    <td><a href="{{ url({'for' : 'message_detail', 'id' : item['message_id'], 'query': '?' ~ http_build_query({'filter': filter}) }) }}">{{item['description']}}</a></td>
                                    <td>{{item['created_at']}}</td>
                                </tr>
                            {% endfor %}
                        {% endif %}
                    </table>
                    {% set result = listMessage %}
                {% if result != null %}
                {% if result['total_pages'] > 1 %}
                    <div class="row text-right">
                        <div class="col-md-12">
                            <div class="dataTables_paginate paging_bootstrap">
                                {% if result['total_items'] > result['limit'] %}
                                    {% set start = (result['current'] - 1) * result['limit'] + 1 %}
                                    {% if ((result['current'] *  result['limit']) > result['total_items']) %}
                                        {% set end = result['total_items'] %}
                                    {% else %}
                                        {% set end = result['current'] *  result['limit'] %}
                                    {% endif %}
                                    <div class="text-cout"> {{ start }} - {{ end }} của {{ result['total_items'] }} kết quả</div>
                                {% else %}
                                    <div class="text-cout">1 - {{ result['total_items'] }} của {{ result['total_items'] }} kết quả</div>
                                {% endif %}
                                <ul class="pagination">
                                    {% if result['before'] == result['current'] %}
                                        <li class="prev">
                                            <a>
                                                <span>Trước</span>
                                            </a>
                                        </li>
                                    {% else %}
                                        <li class="prev">
                                            <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({'q': q, 'filter': filter, 'page': result.before})}) }}">
                                                <span>Trước</span>
                                            </a>
                                        </li>
                                    {% endif %}

                                    {% if result['current'] == result['last'] %}
                                        {% set start = result['current'] - 4 %}
                                    {% else %}
                                        {% set start = result['current'] - 3 %}
                                    {% endif %}

                                    {% for i in start..result['current'] - 1 %}
                                        {% if i > 0 %}
                                            <li>
                                                <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({ 'filter': filter, 'page': i})}) }}">
                                                    {{ i }}
                                                </a>
                                            </li>
                                        {% endif %}
                                    {% endfor %}

                                    <li class="active">
                                        <a>
                                            {{ result['current'] }}
                                        </a>
                                    </li>

                                    {% if result['current'] == 1 %}
                                        {% set end = result['current'] + 4 %}
                                    {% else %}
                                        {% set end = result['current'] + 3 %}
                                    {% endif %}

                                    {% for i in result['current'] + 1..end %}
                                        {% if i <= result['last'] %}
                                            <li>
                                                <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({ 'filter': filter, 'page': i})}) }}">
                                                    {{ i }}
                                                </a>
                                            </li>
                                        {% endif %}
                                    {% endfor %}

                                    {% if result['next'] == result['current'] %}
                                        <li class="next">
                                            <a>
                                                <span>Sau</span>
                                            </a>
                                        </li>
                                    {% else %}
                                        <li class="next">
                                            <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({ 'filter': filter, 'page': result.next})}) }}">
                                                <span>Sau</span>
                                            </a>
                                        </li>
                                    {% endif %}
                                </ul>
                            </div>
                        </div>
                    </div>
                {% endif %}
                {% endif %}
                </div>
            </div>
        </div>
    </div>

{% endblock %}
