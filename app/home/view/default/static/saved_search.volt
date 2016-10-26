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
                            <li><a href="{{ url({'for':'static_saved_search'}) }}" class="active">Saved Searchs</a></li>
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
                <div class="des-title">You saved <b class="text-danger"> 5 </b> search <b class="text-danger">Saved Searches</b>. Showing<b class="text-danger"> 1-15.</b></div>
                <div class="table-content2 m-t-30">
                    <table>
                        <thead>
                        <th class="frist">Search</th>
                        <th width="110px">Created</th>
                        <th width="110px">Notifications</th>
                        <th width="65px" class="text-center"><img src="{{ img_dir }}icon/ic-trash-black.png" alt=""></th>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="frist">
                                <div class="title-entry">Saved Search 20/11/2014</div>
                                <div class="des-entry">Newbury Park, All homes for sale, All prices, Town home</div>
                            </td>
                            <td>20/11/2014</td>
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
                            <td class="text-center">
                                <label for="fdl" class="custom-checkbox">
                                    <input type="checkbox" name="fdl" id="fdl"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="frist">
                                <div class="title-entry">Saved Search 20/11/2014</div>
                                <div class="des-entry">Newbury Park, All homes for sale, All prices, Town home</div>
                            </td>
                            <td>20/11/2014</td>
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
                            <td class="text-center">
                                <label for="fdl" class="custom-checkbox">
                                    <input type="checkbox" name="fdl" id="fdl"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="frist">
                                <div class="title-entry">Saved Search 20/11/2014</div>
                                <div class="des-entry">Newbury Park, All homes for sale, All prices, Town home</div>
                            </td>
                            <td>20/11/2014</td>
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
                            <td class="text-center">
                                <label for="fdl" class="custom-checkbox">
                                    <input type="checkbox" name="fdl" id="fdl"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="frist">
                                <div class="title-entry">Saved Search 20/11/2014</div>
                                <div class="des-entry">Newbury Park, All homes for sale, All prices, Town home</div>
                            </td>
                            <td>20/11/2014</td>
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
                            <td class="text-center">
                                <label for="fdl" class="custom-checkbox">
                                    <input type="checkbox" name="fdl" id="fdl"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="frist">
                                <div class="title-entry">Saved Search 20/11/2014</div>
                                <div class="des-entry">Newbury Park, All homes for sale, All prices, Town home</div>
                            </td>
                            <td>20/11/2014</td>
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
                            <td class="text-center">
                                <label for="fdl" class="custom-checkbox">
                                    <input type="checkbox" name="fdl" id="fdl"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="text-center m-t-30"><a href="" class="btn esta-button">Save</a>&#160 &#160 &#160<a href="" class="btn esta-button dis">Cancel</a></div>
            </div>
        </div>
    </div>
{% endblock %}
