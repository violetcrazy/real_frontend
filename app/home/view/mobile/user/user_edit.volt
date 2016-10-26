{% extends 'mobile_template.volt' %}

{% block title %}{{ user['firstname'] ~ ' ' ~ user['name'] }} - Setting{% endblock %}
{% block description %}{{ user['firstname'] ~ ' ' ~ user['name'] }} - Setting{% endblock %}
{% block keywords %}{{ user['firstname'] ~ ' ' ~ user['name'] }} - Setting{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({ 'for' : 'user_edit' }) }}"/>
{% endblock %}
{% block top_js %}
    <script>
        var url_upload = "{{ url({"for": "load_upload_image_ajax"}) }}";
    </script>
    <script type="text/javascript"
            src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}upload-avatar.js?{{ config.asset.version }}"></script>
{% endblock %}
{% block content %}
    <div class="main-content">
        <form class="form-custom m-t-5" method="POST" enctype="multipart/form-data">
            <div class="block-avarta m-b-20">
                <div class="entry">
                    <img src="{{ user['avatar'] }}" alt="" class="main">
                    <a href="" class="btn-upload-img">
                        <img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/ic-camera.png" alt="" class="icon">Thay hình đại diện
                    </a>
                </div>
                <input style="display:none" name="files" id="upload-avatar" type="file" accept="image/*" class="hidden">
            </div>
            <h1 class="title-style1">Cài đặt tài khoản</h1>

            <div class="line-input">
                <label>Họ</label>
                <input type="text" id="fristname" name="firstname" value="{{ user['firstname'] }}" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Tên</label>
                <input type="text" id="username" name="lastname" value="{{ user['name'] }}" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Mật khẩu</label>
                <input type="text" placeholder="*****" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Email</label>
                <input type="text" id="email" name="email" value="{{ user['email'] }}" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Điện thoại</label>
                <input type="text" id="phone" name="phone" value="{{ user['phone'] }}" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label for="">Tỉnh thành</label>
                <select name="province" id="province">
                    <option value="">Chọn tỉnh thành</option>
                    {% for item in list_province %}
                        <option {{ (item['id'] == user['province_id']) ? 'selected="selected"' : '' }}
                                value="{{ item['id'] }}">{{ item['name'] }}</option>
                    {% endfor %}
                </select>
            </div>
            {% for item in list_province %}
                {% if item['id'] == user['province_id'] %}
                    {% set list_district = item['district'] %}
                {% endif %}
            {% endfor %}
            <div class="line-input m-t-10">
                <label for="">Quận huyện</label>
                <select name="district" id="district">
                    <option value="">Chọn Quận huyện</option>
                    {% for item in list_district %}
                        <option {{ (item['id'] == user['district_id']) ? 'selected' : '' }}
                                value="{{ item['id'] }}">{{ item['name'] }}</option>
                    {% endfor %}
                </select>
            </div>
            <div class="line-input m-t-10">
                <label>Sinh nhật</label>

                <div class="row-col">
                    <div class="col-xs-4">
                        {% set date = date('d',  strtotime(user['birthday'])) %}
                        <select name="day">
                            <option value="1">Chọn ngày</option>
                            {% for item in 1..31 %}
                                <option {{ (date == item) ? 'selected' : '' }} value="{{ item }}">{{ item }}</option>
                            {% endfor %}
                        </select>
                    </div>
                    <div class="col-xs-4">
                        {% set month = date('m',  strtotime(user['birthday'])) %}
                        <select name="month">
                            <option value="1">Chọn tháng</option>
                            {% for item in 1..12 %}
                                <option {{ (month == item) ? 'selected' : '' }} value="{{ item }}">{{ item }}</option>
                            {% endfor %}
                        </select>
                    </div>
                    <div class="col-xs-4">
                        {% set year = date('Y',  strtotime(user['birthday'])) %}
                        <select name="year">
                            <option value="1980">Chọn năm</option>
                            {% for i in date('Y', strtotime('-80 years'))..date('Y', strtotime('-10 years')) %}
                                <option {{ (year == i) ? 'selected' : '' }} value="{{ i }}">{{ i }}</option>
                            {% endfor %}
                        </select>
                    </div>
                </div>
            </div>
            <div class="line-input m-t-10">
                <label>Nghề nghiệp</label>
                <input type="text" id="job_title" name="job_title" value="{{ user['job_title'] }}" class="esta-input">

                <div class="clearfix"></div>
            </div>
            <div class="hr m-t-15 m-b-15"></div>
            <h1 class="title-style1">Cài đặt thông báo</h1>

            <div class="line-input m-t-10">
                <label>Lưu kết quả</label>

                <div class="row-col">
                    <div class="col-xs-6">
                        <label for="save_search_on" class="custom-checkbox">
                            <input type="radio" name="save_search"
                                   id="save_search_on" {% if (user['save_search'] == 1) %} checked {% endif %}value="1"><span
                                    class="mark"></span>Mở
                        </label>
                    </div>
                    <div class="col-xs-6">
                        <label for="save_search_off" class="custom-checkbox">
                            <input type="radio" name="save_search"
                                   id="save_search_off" {% if (user['save_search'] == 0) %} checked {% endif %}
                                   value="0"><span class="mark"></span>Tắt
                        </label>
                    </div>
                </div>
            </div>
            <div class="line-input m-t-10">
                <label>Tin mới</label>

                <div class="row-col">
                    <div class="col-xs-6">
                        <label for="new_letter_on" class="custom-checkbox">
                            <input type="radio" name="new_letter"
                                   id="new_letter_on" {% if (user['new_letter'] == 1) %} checked {% endif %}
                                   value="1"><span class="mark"></span>Mở
                        </label>
                    </div>
                    <div class="col-xs-6">
                        <label for="new_letter_off" class="custom-checkbox">
                            <input type="radio" name="new_letter"
                                   id="new_letter_off" {% if (user['new_letter'] == 0) %} checked {% endif %} value="0"><span
                                    class="mark"></span>Tắt
                        </label>
                    </div>
                </div>
            </div>
            <div class="action-bottom m-t-10 m-b-20">
                <button type="submit" class="link-action esta-button dis block btn-small text-center">Lưu thay đổi
                </button>
            </div>
        </form>
    </div>
    <script>
        $(document).ready(function () {
            $('#province').on('change', function () {
                var province_id = $(this).val();
                console.log('province_id: ', province_id);
                $.ajax({
                    url: '{{ url({ 'for' : 'get_option_district'}) }}',
                    type: 'get',
                    data: {'province_id': province_id},
                    success: function (data) {
                        $('#district').html(data);
                        //$('#dictricts').closest('.dropdown').find('.btn .text').text('Chọn Quận Huyện');
                    }
                });
            });
        });
    </script>
{% endblock %}