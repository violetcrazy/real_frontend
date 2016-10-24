{% extends 'default_home.volt' %}

{% block title %}Message{% endblock %}
{% block description %}Message{% endblock %}
{% block keywords %}Message{% endblock %}

{% block top_js %}
    <script type="text/javascript"
            src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'home'}) }}"/>
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
                                {% set avatar = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/data-example/avatar.png' %}
                            {% endif %}
                            <img src="{{ avatar }}">
                            <a href="" class="btn-upload-img">Update avatar</a>
                            <input name="files" id="upload-avatar" type="file" accept="image/*" class="hidden">
                        </div>
                        <div class="username">{{ user['firstname'] ~ ' ' ~ user['name'] }}</div>
                        <div class="type-user">{% if(user['type'] == 2) %} Agent {% else %} User {% endif %}</div>
                        <ul class="menu-user list-unstyled">
                            {% include 'default_eng/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container">
                        <a href="">MEMBER</a><span class="symbol">></span><a href="" class="current">MESSAGE</a>
                    </div>
                </div>
                <h1 class="title-block">MESSAGE</h1>

                <div class="tools-mess m-b-40">
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}"
                       class="line-icon pull-left {{ filter == 'inbox' ? 'active' : '' }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-inbox.png"
                                 alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-inbox.png"
                             alt="" class="tranparents">
                        Inbox ({{ countMessageInbox }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'send'}) }) }}"
                       class="line-icon pull-left {{ filter == 'send' ? 'active' : '' }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-send.png"
                                 alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-send.png"
                             alt="" class="tranparents">
                        Sent ({{ countMessageSend }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'trash'}) }) }}"
                       class="line-icon pull-left {{ filter == 'trash' ? 'active' : '' }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-trash.png"
                                 alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-trash.png"
                             alt="" class="tranparents">
                        Trash ({{ countMessageTrash }})
                    </a>
                    <a href="{{ url({'for' : 'user_message', 'query': '?' ~ http_build_query({'filter': 'delete'}) }) }}"
                       class="line-icon pull-left {{ filter == 'delete' ? 'active' : '' }}">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-del.png"
                                 alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-del.png"
                             alt="" class="tranparents">
                        Delete ({{ countMessageDelete }})
                    </a>
                    <a href="{{ url({ 'for' : 'user_edit' }) }}" class="line-icon pull-right">
                        <div class="icon">
                            <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-setting.png"
                                 alt="">
                        </div>
                        <img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-mess-setting.png"
                             alt="" class="tranparents">
                        Message
                    </a>

                    <div class="clearfix"></div>
                </div>
                <div class="messages-detail">
                    <div class="entry">
                        <div class="box-detail">
                            <table>
                                <tr>
                                    <th>
                                        <img src="asset/img/data-example/avatar.png" alt="" class="avatar">
                                    </th>
                                    <td>
                                        {% if filter == 'send' %}
                                            <div class="header-table">Send to <br/>
                                                <small>{{ message['name'] }}</small>
                                            </div>
                                        {% else %}
                                            <div class="header-table">{{ message['name'] }} <br/>
                                                <small>Send to me</small>
                                            </div>
                                        {% endif %}
                                        <div class="mess-entry">
                                            {{ message['description'] }}
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

{% endblock %}
