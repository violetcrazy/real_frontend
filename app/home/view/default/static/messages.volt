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
                            <li><a href="{{ url({'for':'static_messages'}) }}" class="active">Messages</a></li>
                            <li><a href="{{ url({'for':'static_settings'}) }}">Settings</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">USER</a><span class="symbol">></span><a href="" class="current">MESSAGES</a>
                    </div>
                </div>
                <h1 class="title-block">MESSAGES</h1>
                <div class="tools-mess m-b-40"><a class="line-icon pull-left">
                        <div class="icon"><img src="{{ img_dir }}icon/ic-mess-inbox.png" alt=""></div><img src="{{ img_dir }}icon/ic-mess-inbox.png" alt="" class="tranparents">Inbox (1)</a><a class="line-icon pull-left">
                        <div class="icon"><img src="{{ img_dir }}icon/ic-mess-send.png" alt=""></div><img src="{{ img_dir }}icon/ic-mess-send.png" alt="" class="tranparents">Sent (1)</a><a class="line-icon pull-left">
                        <div class="icon"><img src="{{ img_dir }}icon/ic-mess-trash.png" alt=""></div><img src="{{ img_dir }}icon/ic-mess-trash.png" alt="" class="tranparents">Trash (1)</a><a class="line-icon pull-left">
                        <div class="icon"><img src="{{ img_dir }}icon/ic-mess-del.png" alt=""></div><img src="{{ img_dir }}icon/ic-mess-del.png" alt="" class="tranparents">Delete (1)</a><a class="line-icon pull-right">
                        <div class="icon"><img src="{{ img_dir }}icon/ic-mess-setting.png" alt=""></div><img src="{{ img_dir }}icon/ic-mess-setting.png" alt="" class="tranparents">Settings</a>
                    <div class="clearfix"></div>
                </div>
                <div class="table-messages">
                    <table>
                        <tr>
                            <td width="50px">
                                <label for="check1" class="custom-checkbox">
                                    <input type="checkbox" name="check1" id="check1"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                            <td>Dinh Manh C.</td>
                            <td><a href="">We have received your first payment!</a></td>
                            <td>9:35 am</td>
                        </tr>
                        <tr class="read">
                            <td>
                                <label for="check2" class="custom-checkbox">
                                    <input type="checkbox" name="check2" id="check2"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                            <td>Dinh Manh C.</td>
                            <td><a href="">We have received your first payment!</a></td>
                            <td>9:35 am</td>
                        </tr>
                        <tr>
                            <td>
                                <label for="check3" class="custom-checkbox">
                                    <input type="checkbox" name="check3" id="check3"/><span class="mark"></span><span class="text"></span>
                                </label>
                            </td>
                            <td>Dinh Manh C.</td>
                            <td><a href="">We have received your first payment!</a></td>
                            <td>9:35 am</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
