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
                            <li><a href="{{ url({'for':'static_purchased_properties'}) }}">Purchased Properties</a></li>
                            <li><a href="{{ url({'for':'static_saved_home'}) }}" class="active">Saved Homes</a></li>
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
                <h2 class="title-block title-page">PURCHASED PROPERTIES</h2>
                <div class="des-title">You added <b class="text-danger"> 5 </b> properties to Saved Homes. Showing <b class="text-danger"> 1-15.</b></div>
                <div class="sort-wrap m-t-20"><span class="text-intro">Sort by</span>
                    <div class="content-sort">
                        <div class="item">
                            <div class="dropdown custom-select">
                                <input type="hidden" id="undefined" name="15"/>
                                <button type="button" id="15" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">15 results</span><span class="arrow"></span></button>
                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                    <li><a href="" data-value="30">30 results</a></li>
                                    <li><a href="" data-value="45">45 results</a></li>
                                    <li><a href="" data-value="60">60 results</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="item">
                            <div class="dropdown custom-select">
                                <input type="hidden" id="undefined" name="1"/>
                                <button type="button" id="1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Esta Recommened</span><span class="arrow"></span></button>
                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                    <li><a href="" data-value="2">item</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="item">
                            <div class="dropdown custom-select">
                                <input type="hidden" id="undefined" name="Price"/>
                                <button type="button" id="Price" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Price</span><span class="arrow"></span></button>
                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                    <li><a href="" data-value="2">item</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="item">
                            <div class="dropdown custom-select">
                                <input type="hidden" id="undefined" name="project"/>
                                <button type="button" id="project" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Project Name</span><span class="arrow"></span></button>
                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                    <li><a href="" data-value="2">item</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
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
                                <div class="action-item"><a href="" data-title="Vinhomes Times City" data-toggle="modal" data-target="#email-agent" aria-hidden="true" data-dismiss="modal" class="send-email-agent line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-mail-grey.png" alt=""></span>Email Agent</a><a href="" class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-trash-grey.png" alt=""></span>Remove</a></div>
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
                                <div class="action-item"><a href="" data-title="Vinhomes Times City" data-toggle="modal" data-target="#email-agent" aria-hidden="true" data-dismiss="modal" class="send-email-agent line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-mail-grey.png" alt=""></span>Email Agent</a><a href="" class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-trash-grey.png" alt=""></span>Remove</a></div>
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
                                <div class="action-item"><a href="" data-title="Vinhomes Times City" data-toggle="modal" data-target="#email-agent" aria-hidden="true" data-dismiss="modal" class="send-email-agent line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-mail-grey.png" alt=""></span>Email Agent</a><a href="" class="line-icon"><span class="icon"><img src="{{ img_dir }}icon/ic-trash-grey.png" alt=""></span>Remove</a></div>
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
                    <div class="pagination">
                        <div class="text-cout">1-15 of 1,438 Results</div>
                        <ul class="list-link list-unstyled">
                            <li><a href="" class="first"></a></li>
                            <li><a href="" class="item active">1</a></li>
                            <li><a href="" class="item">2</a></li>
                            <li><a href="" class="item">3</a></li>
                            <li><a href="" class="item">4</a></li>
                            <li><a href="" class="item">5</a></li>
                            <li><a href="" class="last"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
