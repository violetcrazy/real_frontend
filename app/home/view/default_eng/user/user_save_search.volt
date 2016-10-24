{% extends 'default_home.volt' %}

{% block title %}Search{% endblock %}
{% block description %}Search{% endblock %}
{% block keywords %}Search{% endblock %}

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
                            {% include 'default_eng/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">User</a><span class="symbol">></span><a href="" class="current">PURCHASED PROPERTIES</a>
                    </div>
                </div>
                <h2 class="title-block title-page">PURCHASED PROPERTIES</h2>
                {% if listSaveSearch['result'] is empty %}
                    <div class="table-content2 m-t-30">
                        Not found
                    </div>
                {% else %}
                    <form class="form-horizontal dropdown-select-control select-scroll" method="POST" enctype="multipart/form-data">
                        <div class="des-title">You saved <b class="text-danger"> {{ listSaveSearch['total_items'] }} </b> search <b class="text-danger">Saved Searches</b>. Showing<b class="text-danger"> 1-15.</b></div>
                        <div class="table-content2 m-t-30">
                            <table>
                                <thead>
                                <th class="frist">Search</th>
                                <th width="110px">Created</th>
                                <th width="110px">Notifications</th>
                                {#<th width="65px" class="text-center"><img src="{{ config.asset.frontend_url }}/desktop/version-1.0/template/html_project/asset/img/icon/ic-trash-black.png" alt=""></th>#}
                                </thead>
                                <tbody>
                                    {% for item in listSaveSearch['result'] %}
                                        <tr>
                                            <td class="frist">
                                                <div class="des-entry">{{ item['value'] }}</div>
                                            </td>
                                            <td>{{ item['created_at'] }}</td>
                                            <td>
                                                <div class="dropdown custom-select">
                                                    <input type="hidden" id="undefined" name=""/>
                                                    <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Daily</span><span class="arrow"></span></button>
                                                    <ul aria-labelledby="type-project" class="dropdown-menu">
                                                        <li><a href="" data-value="0">Daily</a></li>
                                                        <li><a href="" data-value="1">Monthly</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                            {#
                                            <td class="text-center">
                                                <label for="fdl" class="custom-checkbox">
                                                    <input type="checkbox" name="fdl" id="fdl" value="{{ item['id'] }}"/><span class="mark"></span><span class="text"></span>
                                                </label>
                                            </td>
                                            #}
                                        </tr>
                                    {% endfor %}
                                </tbody>
                            </table>
                        </div>
                        {#<div class="text-center m-t-30"><a href="" class="btn esta-button">Save</a>&#160 &#160 &#160<a href="" class="btn esta-button dis">Cancel</a></div>#}
                    </form>
                {% endif %}
            </div>
        </div>
    </div>

{% endblock %}
