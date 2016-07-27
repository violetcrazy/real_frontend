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
                        <div class="type-user">Người dùng</div>
                        <ul class="menu-user list-unstyled">
                            <li><a href="{{ url({'for':'static_user'}) }}" class="active">Thông tin cơ bản </a></li>
                            <li><a href="{{ url({'for':'static_purchased_properties'}) }}">Những căn hộ đã mua</a></li>
                            <li><a href="{{ url({'for':'static_saved_home'}) }}">Căn hộ ưa thích</a></li>
                            <li><a href="{{ url({'for':'static_saved_search'}) }}">Lịch sử tìm kiếm </a></li>
                            <li><a href="{{ url({'for':'static_messages'}) }}">Tin nhắn</a></li>
                            <li><a href="{{ url({'for':'static_settings'}) }}">Cài đặt tài khoản</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">User</a><span class="symbol">></span><a href="" class="current">Basic info</a>
                    </div>
                </div>
                <h2 class="title-block title-page">BASIC INFO</h2>
                <div class="top-info">
                    <h1 class="username">Dat Nguyen</h1>
                    <div class="des">Joined Sep 21, 2015</div>
                </div>
                <hr>
                <div class="info-user-line">
                    <table class="table-content">
                        <tr>
                            <th width="90px" class="text">Ngày sinh:</th>
                            <td class="detail">01/05/1991</td>
                        </tr>
                        <tr>
                            <th class="text">Email</th>
                            <td class="detail">datnguyen@gmail.com</td>
                        </tr>
                        <tr>
                            <th class="text">Số điện thoại</th>
                            <td class="detail">0975 628 172</td>
                        </tr>
                        <tr>
                            <th class="text">Địa chỉ:</th>
                            <td class="detail">Nguyen Kiem, Binh Thanh, HCM</td>
                        </tr>
                        <tr>
                            <th class="text">Quốc Gia: </th>
                            <td class="detail">Việt Nam</td>
                        </tr>
                        <tr>
                            <th class="text">Chức vụ:</th>
                            <td class="detail">Quản lí</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
{% endblock %}
