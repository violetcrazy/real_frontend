{% extends 'default_home.volt' %}

{% block content %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
    <div class="container m-t-30 m-b-30">
        <div class="row">
            <div class="col-xs-3">
                <div class="entry-sidebar">
                    <div class="content-block sidebar-user">
                        <div class="avatar"><img src="{{ img_dir }}data-example/avatar.png"></div>
                        <div class="username">DINH MANH C</div>
                        <div class="type-user">User</div>
                        <ul class="menu-user list-unstyled">
                            <li><a href="{{ url({'for':'static_user'}) }}">Basic Info</a></li>
                            <li><a href="{{ url({'for':'static_purchased_properties'}) }}" class="active">Purchased Properties</a></li>
                            <li><a href="{{ url({'for':'static_saved_home'}) }}">Saved Homes</a></li>
                            <li><a href="{{ url({'for':'static_saved_search'}) }}">Saved Searchs</a></li>
                            <li><a href="{{ url({'for':'static_messages'}) }}">Messages</a></li>
                            <li><a href="{{ url({'for':'static_settings'}) }}">Settings</a></li>
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
                <div class="list-style2">
                    <div class="wrap-list">
                        <div class="item">
                            <div class="thumbnail">
                                <div class="favorite active"></div><img src="{{ img_dir }}data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
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
                                <div class="favorite active"></div><img src="{{ img_dir }}data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
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
                                <div class="favorite active"></div><img src="{{ img_dir }}data-example/search1.png" alt="">
                            </div>
                            <div class="summary">
                                <h3 class="title">Vinhomes Times City-A7-88
                                    <div class="price line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-dola.png" alt=""></span>300.000</div>
                                </h3>
                                <div class="address">
                                    <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-location-small.png" alt=""></span>Dist. 2, HCMC</div>
                                </div>
                                <div class="properties-entry">
                                    <div class="row-box">
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-floor-black.png" alt=""></span>Floor 9st</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-size-black.png" alt=""></span>50m2</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bed-black.png" alt=""></span>2 bedrooms</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-orientation-black.png" alt=""></span>South East</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-sea-view-black.png" alt=""></span>Sea view</div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-bath-black.png" alt=""></span>1 bathroom</div>
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
            </div>
        </div>
    </div>
{% endblock %}
