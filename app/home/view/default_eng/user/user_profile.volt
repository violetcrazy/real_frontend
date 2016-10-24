{% extends 'default_home.volt' %}

{% block title %}Profile{% endblock %}
{% block description %}Profile{% endblock %}
{% block keywords %}Profile{% endblock %}

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
                            <a href="" class="btn-upload-img">Update avatar</a>
                            <input name="files" id="upload-avatar" type="file" accept="image/*" class="hidden">
                        </div>
                        <div class="username">{{ user['firstname'] ~ ' ' ~ user['name']}}</div>
                        <div class="type-user">{% if(user['type'] == 2) %} Agent {% else %} User {% endif %}</div>
                        <ul class="menu-user list-unstyled">
                            {% include 'default_eng/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">USER</a><span class="symbol">></span><a href="" class="current">PROFILE</a>
                    </div>
                </div>
                <h2 class="title-block title-page">PROFILE</h2>
                <div class="top-info">
                    <h1 class="username">
                        {{ user['name'] }}
                        <a href="{{ url({ 'for' : 'user_edit' }) }}" class="pull-right edit-profile">Edit</a>
                    </h1>
                    {% set date_register = date('d-m-Y',  strtotime(user['created_at'])) %}
                    <div class="des">Joined: {{ date_register }}</div>
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
                            <th class="text">Address</th>
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
