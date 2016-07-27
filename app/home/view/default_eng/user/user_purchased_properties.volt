{% extends 'default_home.volt' %}

{% block title %}Purchased Properties{% endblock %}
{% block description %}Purchased Properties{% endblock %}
{% block keywords %}Purchased Properties{% endblock %}

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
                <h2 class="title-block title-page n-m-b">PURCHASED PROPERTIES</h2>
                {#
                <div class="list-style2">
                    <div class="wrap-list">
                        <div class="item">
                            <div class="thumbnail">
                                <div class="favorite active"></div><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
                                        </div>
                                    </div>
                                </div><a class="esta-button btn">More detail</a>
                                <div class="block-status-progress"><span class="text-title">Paid</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 40%;" class="progress-bar">
                                            <div class="text">40%</div>
                                        </div>
                                    </div><span class="text-title build">Built</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 60%;" class="progress-bar">
                                            <div class="text">60%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="settings-notify"><i class="text-label pull-left">Notifications</i>
                                <div class="select pull-left">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">On</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">On</a></li>
                                            <li><a href="" data-value="1">Off</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="thumbnail">
                                <div class="favorite active"></div><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
                                        </div>
                                    </div>
                                </div><a class="esta-button btn">More detail</a>
                                <div class="block-status-progress"><span class="text-title">Paid</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 40%;" class="progress-bar">
                                            <div class="text">40%</div>
                                        </div>
                                    </div><span class="text-title build">Built</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 60%;" class="progress-bar">
                                            <div class="text">60%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="settings-notify"><i class="text-label pull-left">Notifications</i>
                                <div class="select pull-left">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">On</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">On</a></li>
                                            <li><a href="" data-value="1">Off</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="thumbnail">
                                <div class="favorite active"></div><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url}}desktop/version-1.0/template/html_project/asset/img/icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
                                        </div>
                                    </div>
                                </div><a class="esta-button btn">More detail</a>
                                <div class="block-status-progress"><span class="text-title">Paid</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 40%;" class="progress-bar">
                                            <div class="text">40%</div>
                                        </div>
                                    </div><span class="text-title build">Built</span>
                                    <div class="progress">
                                        <div role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: 60%;" class="progress-bar">
                                            <div class="text">60%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="settings-notify"><i class="text-label pull-left">Notifications</i>
                                <div class="select pull-left">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">On</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">On</a></li>
                                            <li><a href="" data-value="1">Off</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                #}
            </div>
        </div>
    </div>

{% endblock %}
