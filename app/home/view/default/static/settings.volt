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
                            <li><a href="{{ url({'for':'static_saved_home'}) }}">Saved Homes</a></li>
                            <li><a href="{{ url({'for':'static_saved_search'}) }}">Saved Searchs</a></li>
                            <li><a href="{{ url({'for':'static_messages'}) }}">Messages</a></li>
                            <li><a href="{{ url({'for':'static_settings'}) }}" class="active">Settings</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">User</a><span class="symbol">></span><a href="" class="current">Settings</a>
                    </div>
                </div>
                <h2 class="title-block title-page">Settings</h2>
                <form class="form-horizontal dropdown-select-control">
                    <hr>
                    <h3 class="title-form">Account Settings</h3>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">First name</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Last name</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Password</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Birthday</label>
                        <div class="col-xs-8">
                            <div class="row-10">
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Mounth</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">0</a></li>
                                            <li><a href="" data-value="1">1</a></li>
                                            <li><a href="" data-value="2">2</a></li>
                                            <li><a href="" data-value="3">3</a></li>
                                            <li><a href="" data-value="4">4</a></li>
                                            <li><a href="" data-value="5">5</a></li>
                                            <li><a href="" data-value="6">6</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Day</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">0</a></li>
                                            <li><a href="" data-value="1">1</a></li>
                                            <li><a href="" data-value="2">2</a></li>
                                            <li><a href="" data-value="3">3</a></li>
                                            <li><a href="" data-value="4">4</a></li>
                                            <li><a href="" data-value="5">5</a></li>
                                            <li><a href="" data-value="6">6</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Year</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">1990</a></li>
                                            <li><a href="" data-value="1">1992</a></li>
                                            <li><a href="" data-value="2">1994</a></li>
                                            <li><a href="" data-value="3">1996</a></li>
                                            <li><a href="" data-value="4">1998</a></li>
                                            <li><a href="" data-value="5">2000</a></li>
                                            <li><a href="" data-value="6">2002</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Phone</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Address</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Country</label>
                        <div class="col-xs-8">
                            <div class="row-10">
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">City</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">0</a></li>
                                            <li><a href="" data-value="1">1</a></li>
                                            <li><a href="" data-value="2">2</a></li>
                                            <li><a href="" data-value="3">3</a></li>
                                            <li><a href="" data-value="4">4</a></li>
                                            <li><a href="" data-value="5">5</a></li>
                                            <li><a href="" data-value="6">6</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">District</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">0</a></li>
                                            <li><a href="" data-value="1">1</a></li>
                                            <li><a href="" data-value="2">2</a></li>
                                            <li><a href="" data-value="3">3</a></li>
                                            <li><a href="" data-value="4">4</a></li>
                                            <li><a href="" data-value="5">5</a></li>
                                            <li><a href="" data-value="6">6</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Ward</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">1990</a></li>
                                            <li><a href="" data-value="1">1992</a></li>
                                            <li><a href="" data-value="2">1994</a></li>
                                            <li><a href="" data-value="3">1996</a></li>
                                            <li><a href="" data-value="4">1998</a></li>
                                            <li><a href="" data-value="5">2000</a></li>
                                            <li><a href="" data-value="6">2002</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Job tittle</label>
                        <div class="col-sm-8">
                            <input type="text" id="name" class="form-control">
                        </div>
                    </div>
                    <hr>
                    <h3 class="title-form">Saved Searches</h3>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Saved Searches</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_search_on" class="custom-checkbox">
                                        <input type="radio" name="save_search" id="save_search_on"/><span class="mark"></span><span class="text">On</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_search_off" class="custom-checkbox">
                                        <input type="radio" name="save_search" id="save_search_off"/><span class="mark"></span><span class="text">Off</span>
                                    </label>
                                </div>
                                <div class="col-xs-4"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Saved Houses</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_houses_on" class="custom-checkbox">
                                        <input type="radio" name="save_houses" id="save_houses_on"/><span class="mark"></span><span class="text">On</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_houses_off" class="custom-checkbox">
                                        <input type="radio" name="save_houses" id="save_houses_off"/><span class="mark"></span><span class="text">Off</span>
                                    </label>
                                </div>
                                <div class="col-xs-4"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Purchased Properties</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="purchased_on" class="custom-checkbox">
                                        <input type="radio" name="purchased" id="purchased_on"/><span class="mark"></span><span class="text">On</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="purchased_off" class="custom-checkbox">
                                        <input type="radio" name="purchased" id="purchased_off"/><span class="mark"></span><span class="text">Off</span>
                                    </label>
                                </div>
                                <div class="col-xs-4"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Newsletter</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="newsletter_on" class="custom-checkbox">
                                        <input type="radio" name="newsletter" id="newsletter_on"/><span class="mark"></span><span class="text">On</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="newsletter_off" class="custom-checkbox">
                                        <input type="radio" name="newsletter" id="newsletter_off"/><span class="mark"></span><span class="text">Off</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 size-check-box">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Daily</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">Daily</a></li>
                                            <li><a href="" data-value="1">Weekly</a></li>
                                            <li><a href="" data-value="2">Monthly</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="text-center action-bottom">
                        <button type="submit" class="btn esta-button btn-lg">Save</button>
                        <button type="reset" class="btn esta-button btn-lg dis">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
{% endblock %}
