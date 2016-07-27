{% extends 'default_home.volt' %}

{% block title %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}
{% block description %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}
{% block keywords %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'user_detail', 'id': user['id']}) }}" />
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
                        <div class="type-user">{% if(user['type'] == 2) %} Agent{% else %} User {% endif %}</div>
                        <ul class="menu-user list-unstyled">
                            {% if userName == 'user' and userAction == 'detail' %}
                            <li><a href="{{ url({'for' : 'user_detail', 'id' : id}) }}"  class="active">Profile</a></li>
                            {% else %}
                            <li><a href="{{ url({'for' : 'user_detail', 'id' : id}) }}">Profile</a></li>
                            {% endif %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <h2 class="title-block title-page">PROFILE</h2>
                <div class="top-info">
                    <h1 class="username">
                        {{ user['name'] }}
                    </h1>
                    {% set date_register = date('d-m-Y',  strtotime(user['created_at'])) %}
                    <div class="des">Date: {{ date_register }}</div>
                </div>
                <hr>
                <div class="info-user-line">
                    <table class="table-content">
                        <tr>
                            <th width="90px" class="text">Birthday</th>
                                {% set birthday = date('d-m-Y',  strtotime(user['birthday'])) %}
                            <td class="detail">{{ birthday }}</td>
                        </tr>
                        <tr>
                            <th class="text">Email</th>
                            <td class="detail">{{ user['email'] }}</td>
                        </tr>
                        <tr>
                            <th class="text">Phone</th>
                            <td class="detail">{{ user['phone'] }}</td>
                        </tr>
                        <tr>
                            <th class="text">Adress</th>
                            <td class="detail">{{ user['address'] }}</td>
                        </tr>
                        <tr>
                            <th class="text">Country</th>
                            <td class="detail">VietNam</td>
                        </tr>
                        <tr>
                            <th class="text">Job</th>
                            <td class="detail">{{ user['job_title'] }}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

{% endblock %}
