{% extends 'mobile_template.volt' %}

{% block title %}Đăng ký tài khoản{% endblock %}
{% block description %}Đăng ký tài khoản{% endblock %}
{% block keywords %}Đăng ký tài khoản{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({ 'for' : 'user_register' }) }}" />
{% endblock %}

{% block content %}
    <div class="block-header-tab layout-2"><a href="{{ url({ 'for' : 'agent_register' }) }}" class="item">Đại lý</a><a class="active item">Người dùng</a>
        <div class="clearfix"></div>
    </div>
    <div class="main-content">
        <form id="register" class="form-custom m-t-5" method="POST" enctype="multipart/form-data">
            <h1 class="title-style1">Đăng ký</h1>
            <div class="line-input">
                <label>Họ</label>
                <input type="text" id="fristname" name="firstname" placeholder="Nhập họ" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Tên</label>
                <input type="text" id="username" name="lastname" placeholder="Nhập tên" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu" class="esta-input">
            </div>
            <div class="line-input m-t-10">
                <label>Email</label>
                <input type="email" name="email" id="email" placeholder="Nhập email" class="esta-input">
            </div>
            
            <div class="line-input m-t-10">
                <label for="">Tỉnh thành</label>
                <select name="province" id="province">
                    <option value="">Chọn tỉnh thành</option>
                    {% for item in list_province %}
                        <option value="{{ item['id'] }}">{{ item['name'] }}</option>
                    {% endfor %}
                </select>
            </div>
            <div class="line-input m-t-10">
                <label for="">Quận huyện</label>
                <select name="district" id="district">
                    <option value="">Chọn Quận huyện</option>
                </select>
            </div>
            <div class="line-input m-t-10">
                <label for="address" class="col-xs-2 control-label"></label>
                <input type="text" name="address" id="country" placeholder="Nhập địa chỉ" class="form-control">
            </div>
            <div class="line-input m-t-10">
                <label>Sinh nhật</label>
                <div class="row-col">
                    <div class="col-xs-4">
                        <select name="day">
                            <option value="1">Chọn ngày</option>
                            {% for item in 1..31 %}
                                <option value="{{ item }}">{{ item }}</option>
                            {% endfor %}
                        </select>
                    </div>
                    <div class="col-xs-4">
                        <select name="month">
                            <option value="1">Chọn tháng</option>
                            {% for item in 1..12 %}
                                <option value="{{ item }}">{{ item }}</option>
                            {% endfor %}
                        </select>
                    </div>
                    <div class="col-xs-4">
                        <select name="year">
                            <option value="1980">Chọn năm</option>
                            {% for i in date('Y', strtotime('-80 years'))..date('Y', strtotime('-10 years')) %}
                                <option  value="{{ i }}">{{ i }}</option>
                            {% endfor %}
                        </select>
                    </div>
                </div>
                <div class="line-input m-t-10">
                    <div class="row-col">
                        <div class="col-xs-6">
                            <label for="company" class="custom-checkbox">
                                <input type="radio" name="job_type" value="1" id="company"><span class="mark"></span>Công ty
                            </label>
                        </div>
                        <div class="col-xs-6">
                            <label for="freelancer" class="custom-checkbox">
                                <input type="radio" name="job_type" value="2" id="freelancer"><span class="mark"></span>Tư do
                            </label>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="hr"></div>
                <div class="text-left">
                    <label for="remember" class="custom-checkbox">
                        <input type="checkbox" id="remember"><span class="mark"></span><span class="text-danger">Tôi đồng ý với điều kiện và quy định của JINN.VN</span>
                    </label>
                </div>
                <div class="action-bottom m-t-10 m-b-20"><button type="submit" class="link-action esta-button block btn-small text-center">Đăng ký</button></div>
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
        var r = '{{ status }}';
        var rs = JSON.parse('{{ result }}');
        if (r == '400') {
            $('#register').find('.form-group').removeClass('has-error');
            
            $.each(rs, function(key, value){
                 $('#register')
                         .find('[name="' + key + '"]')
                         .attr('placeholder', value)
                         .closest('.line-input')
                         .addClass('has-error');
            });
         }
    </script>
{% endblock %}