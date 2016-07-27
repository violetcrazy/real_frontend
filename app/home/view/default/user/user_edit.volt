{% extends 'default_home.volt' %}

{% block title %}{{ user['firstname'] ~ ' ' ~ user['name']}} - Cài đặt{% endblock %}
{% block description %}{{ user['firstname'] ~ ' ' ~ user['name']}} - Cài đặt{% endblock %}
{% block keywords %}{{ user['firstname'] ~ ' ' ~ user['name']}} -Cài đặt{% endblock %}

{% block top_js %}
    <script>
        var url_upload = "{{ url({"for": "load_upload_image_ajax"}) }}";
    </script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}upload-avatar.js?{{ config.asset.version }}"></script>
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
                            {% include 'default/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">THÀNH VIÊN</a><span class="symbol">></span><a href="" class="current">CÀI ĐẶT</a>
                    </div>
                </div>
                <h2 class="title-block title-page">CÀI ĐẶT</h2>
                <form class="form-horizontal dropdown-select-control select-scroll" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 text-left control-label">Họ</label>
                        <div class="col-sm-8">
                            <input type="text" id="fristname" name="firstname" value="{{ user['firstname'] }}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 text-left control-label">Tên</label>
                        <div class="col-sm-8">
                            <input type="text" id="username" name="lastname" value="{{ user['name'] }}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 text-left control-label">Mật khẩu</label>
                        <div class="col-sm-8">
                            <input type="password" id="password" name="password" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 text-left control-label">Ngày sinh</label>
                        <div class="col-xs-8">
                            <div class="row-10">
                                <div class="col-xs-4">
                                    {% set date = date('d',  strtotime(user['birthday'])) %}
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name="day" value="{{ date }}">
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false"
                                                class="btn btn-default btn-block dropdown-toggle"><span
                                                class="text">{{ date }}</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            {% for item in 1..31 %}
                                                {% if item < 10 %}
                                                    {% set item = '0' ~ item %}
                                                {% endif %}
                                                <li>
                                                    <a href="" data-value="{{ item }}">{{ item }}</a>
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    {% set month = date('m',  strtotime(user['birthday'])) %}
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name="month" value="{{ month }}">
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false"
                                                class="btn btn-default btn-block dropdown-toggle"><span
                                                class="text">{{ month }}</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            {% for item in 1..12 %}
                                                {% if item < 10 %}
                                                    {% set item = '0' ~ item %}
                                                {% endif %}
                                                <li>
                                                    <a href="" data-value="{{ item }}">{{ item }}</a>
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    {% set year = date('Y',  strtotime(user['birthday'])) %}
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name="year" value="{{ year }}">
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false"
                                                class="btn btn-default btn-block dropdown-toggle"><span
                                                class="text">{{ year }}</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            {% for i in date('Y', strtotime('-80 years'))..date('Y', strtotime('-10 years')) %}
                                                <li><a href="" data-value="{{ i }}">{{ i }}</a></li>
                                                {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 text-left control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="text" id="email" name="email" value="{{ user['email'] }}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 text-left control-label">Điện thoại</label>
                        <div class="col-sm-8">
                            <input type="text" id="phone" name="phone" value="{{ user['phone'] }}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 text-left control-label">Tỉnh thành</label>
                        <div class="col-xs-8">
                            <div class="row-10">
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select" id="province_id_select">
                                        <input type="hidden" id="province" name="province" value="{{ user['province_id'] }}">
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false"
                                                class="btn btn-default btn-block dropdown-toggle">
                                            <span class="text">
                                                {% if user['province_id'] is not empty %}
                                                    {% for item in list_province %}
                                                        {% if item['id'] == user['province_id'] %}
                                                           {{ item['name'] }}
                                                        {% endif %}
                                                    {% endfor %}
                                                {% else %}
                                                    Thành phố
                                                {% endif %}
                                            </span><span class="arrow"></span></button>
                                        <ul aria-labelledby="province_select" class="dropdown-menu">
                                            {% for item in list_province %}
                                                <li><a href="" data-value="{{ item['id'] }}">{{ item['name'] }}</a></li>
                                                {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="dropdown custom-select" id="district_id_select">
                                        <input type="hidden" id="dictricts" name="district" value="{{ user['district_id'] }}">
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false"
                                                class="btn btn-default btn-block dropdown-toggle"><span
                                                class="text">
                                                {% if user['district_id'] is not empty %}
                                                    {% for item in list_province %}
                                                        {% if item['id'] == user['province_id'] %}
                                                            {% set list_district = item['district'] %}
                                                            {% for temp in item['district'] %}
                                                                {% if temp['id'] == user['district_id'] %}
                                                                   {{ temp['name'] }}
                                                                {% endif %}
                                                            {% endfor %}
                                                        {% endif %}
                                                    {% endfor %}
                                                {% else %}
                                                    Quận
                                                {% endif %}</span><span class="arrow"></span>
                                        </button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            {% if list_district is not empty %}
                                                {% for item in list_district %}
                                                    <li><a href="" data-value="{{ item['id'] }}">{{ item['name'] }}</a></li>
                                                {% endfor %}
                                            {% else %}
                                                <li><a href="" data-value="0">0</a></li>
                                            {% endif %}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 text-left control-label"></label>
                        <div class="col-sm-8">
                            <input type="text" id="address" name="address" value="{{ user['address'] }}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="job_title" class="col-sm-2 text-left control-label">Nghề nghiệp</label>
                        <div class="col-sm-8">
                            <input type="text" id="job_title" name="job_title" value="{{ user['job_title']}}" class="form-control">
                        </div>
                    </div>
                    {% if userSession is defined and userSession['type'] == 2 %}
                    <div class="form-group">
                        <label for="experience" class="col-sm-2 text-left control-label">Kinh Nghiệm</label>
                        <div class="col-sm-8">
                            <input type="text" id="job_title" name="experience" value="{{ user['experience']}} " class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 text-left control-label">Giới thiệu</label>
                        <div class="col-sm-8">
                            <textarea id="job_title" class="form-control" rows="3" name="description">{{ user['description']}}</textarea>
                        </div>
                    </div>
                    {% endif %}
                    <hr>
                    <h3 class="title-form">Saved Searches</h3>
                    <div class="clearfix"></div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Saved Searches</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_search_on" class="custom-checkbox">
                                        <input type="radio" name="save_search" id="save_search_on" {% if (user['save_search'] == 1) %} checked {% endif %} value="1"/>
                                        <span class="mark"></span><span class="text">Bật</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_search_off" class="custom-checkbox">
                                        <input type="radio" name="save_search" id="save_search_off" {% if (user['save_search'] == 0) %} checked {% endif %} value="0"/>
                                        <span class="mark"></span><span class="text">Tắt</span>
                                    </label>
                                </div>
                                <div class="col-xs-4"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label text-left">Saved Home</label>
                        <div class="col-sm-7">
                            <div class="row-10">
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_houses_on" class="custom-checkbox">
                                        <input type="radio" name="save_home" id="save_houses_on" {% if (user['save_home'] == 1) %} checked {% endif %} value="1"/>
                                        <span class="mark"></span><span class="text">Bật</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="save_houses_off" class="custom-checkbox">
                                        <input type="radio" name="save_home" id="save_houses_off" {% if (user['save_home'] == 0) %} checked {% endif %} value="0"/>
                                        <span class="mark"></span><span class="text">Tắt</span>
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
                                        <input type="radio" name="purchased" id="purchased_on" {% if (user['purchased_properties'] == 1) %} checked {% endif %} value="1"/>
                                        <span class="mark"></span><span class="text">Bật</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="purchased_off" class="custom-checkbox">
                                        <input type="radio" name="purchased" id="purchased_off" {% if (user['purchased_properties'] == 0) %} checked {% endif %} value="0"/>
                                        <span class="mark"></span><span class="text">Tắt</span>
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
                                        <input type="radio" name="new_letter" id="newsletter_on" {% if (user['new_letter'] == 1) %} checked {% endif %} value="1"/>
                                        <span class="mark"></span><span class="text">Bật</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 checkbox-medium-size">
                                    <label for="newsletter_off" class="custom-checkbox">
                                        <input type="radio" name="new_letter" id="newsletter_off" {% if (user['new_letter'] == 0) %} checked {% endif %} value="0"/>
                                        <span class="mark"></span><span class="text">Tắt</span>
                                    </label>
                                </div>
                                <div class="col-xs-4 size-check-box">
                                    <div class="dropdown custom-select">
                                        <input type="hidden" id="undefined" name=""/>
                                        <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Daily</span><span class="arrow"></span></button>
                                        <ul aria-labelledby="type-project" class="dropdown-menu">
                                            <li><a href="" data-value="0">Hằng ngày</a></li>
                                            <li><a href="" data-value="1">Hằng tuần</a></li>
                                            <li><a href="" data-value="2">Hằng tháng</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="text-center action-bottom">
                        <button type="submit" class="btn esta-button btn-lg">Lưu</button>
                        <button type="reset" class="btn esta-button btn-lg dis">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script>
        $(document).ready(function() {
            $('#province_id_select li a').click(function(event) {
                event.preventDefault();
                var province_id = $(this).data('value');
                console.log('province_id: ', province_id);
                $.ajax({
                    url: '{{ url({ 'for' : 'get_district'}) }}',
                    type: 'get',
                    data: {'province_id': province_id},
                    success: function(data) {
                        $('#dictricts').val('').closest('.dropdown').find('ul').html(data);
                        $('#dictricts').closest('.dropdown').find('.btn .text').text('Chọn Quận Huyện');
                    }
                });
            });
        });
    </script>
{% endblock %}
