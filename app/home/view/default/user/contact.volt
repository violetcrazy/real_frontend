{% extends 'default_home.volt' %}

{% block title %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}
{% block description %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}
{% block keywords %}{{ user['firstname'] ~ ' ' ~ user['name']}}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'user_contact'}) }}" />
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
                        <div class="type-user">{% if(user['type'] == 2) %} Đại lý {% else %} Thành viên {% endif %}</div>
                        <ul class="menu-user list-unstyled">
                            {% include 'default/user/_user_menu.volt' %}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-9 single-user">
                <div class="breadcrumbs">
                    <div class="container"><a href="">THÀNH VIÊN</a><span class="symbol">></span><a href="" class="current">DANH BẠ KHÁCH HÀNG</a>
                    </div>
                </div>
                <h2 class="title-block title-page">
                    Danh bạ khách hàng
                    <a href="#add-customer" data-email="{{ item['customer']['email'] }}" class=" pull-right run-fancybox btn esta-button btn-small send-mail-customer">
                        + Danh bạ
                    </a>
                </h2>

                {% set gender = getUserGender() %}

                <div class="">
                    {% if result is defined and result['status'] == constant('\ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS') and result['result']|length > 0 %}
                        <div class="" id="wrap-list">
                            <div class="list-style2 list-agent">
                                <div class="wrap-list">
                                    {% for item in result['result'] %}
                                        <div class="item" data-info-customer='{{ item|json_encode }}'>
                                            <div class="thumbnail">
                                                <a class="show-info-contact" href="#add-customer">
                                                    <img src="{{ item['customer']['avatar'] is defined and item['customer']['avatar'] != '' ? item['customer']['avatar'] : '' }}" alt="">
                                                </a>
                                                <a class="ranking delete-contact" data-id="{{ item['id'] }}">Xóa liên hệ</a>
                                            </div>
                                            <div class="summary">
                                                <a href="#add-customer" class="title show-info-contact">{{ item['customer']['name'] is defined ? item['customer']['name'] : '' }}</a>
                                                <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-user-navigation.png" alt=""></span>{{ item['customer']['gender'] is defined and item['customer']['gender'] != '' ? gender[item['customer']['gender']] : '' }}</div>

                                                {% if (item['customer']['email'] is defined and item['customer']['email'] is not empty) %}
                                                    <div class="pull-right" style="position: relative; z-index: 99;">
                                                        <a href="#send_email_contact" data-email="{{ item['customer']['email'] }}" class="run-fancybox dis btn esta-button btn-small send-mail-customer">
                                                            Liên hệ
                                                        </a>
                                                    </div>
                                                {% endif %}

                                                <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-mail.png" alt=""></span>{{ item['customer']['email'] is defined and item['customer']['email'] != '' ? item['customer']['email'] : '' }}</div>
                                                <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-phone.png" alt=""></span>{{ item['customer']['phone'] is defined and item['customer']['phone'] != '' ? item['customer']['phone'] : '' }}</div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    {% endfor %}
                                </div>
                            </div>
                        </div>

                        {{ paginationLayout is defined ? paginationLayout : '' }}

                    {% endif %}

                    <div class="wrap-list main-content search-page" id="add-customer" style="display: none;">
                        <form action="" id="add-customer-user" class="m-b-20 form-custom" style="width:320px;">
                            <div class="inner15">
                                <div class="block-avarta m-b-20">
                                    <div class="entry">
                                        <img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/data-example/avatar-default.png" alt="" class="main">
                                        <a href="" class="btn-upload-img">
                                            Hình đại diện</a>
                                        <input type="hidden" id="avatar" class="field-value" name="avatar" value="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/data-example/avatar-default.png">
                                    </div>
                                    <input class="upload-avatar" style="display:none" name="files" id="upload-avatar" type="file" accept="image/*">
                                </div>

                                <div class="line-input m-t-10">
                                    <label>Họ và tên</label>
                                    <input required type="text" name="name" placeholder="Nhập họ và tên" class="esta-input">
                                </div>
                                <div class="line-input m-t-10">
                                    <label>Số điện thoại</label>
                                    <input type="text"  name="phone" placeholder="Nhập số điện thoại" class="esta-input">
                                </div>
                                <div class="line-input m-t-10">
                                    <label>Email</label>
                                    <input required type="email" name="email" placeholder="Nhập email" class="esta-input">
                                </div>
                                <div class="line-input m-t-10">
                                    <label>Địa chỉ</label>
                                    <input type="text" name="address" placeholder="Nhập địa chỉ" class="esta-input">
                                </div>
                                <div class="line-input m-t-10">
                                    <label for="gender">Giới tính</label>
                                    <select name="gender" id="gender">
                                        {% for key, item in gender %}
                                            <option value="{{ key }}">{{ item }}</option>
                                        {% endfor %}
                                    </select>
                                </div>
                                <div class="input-line m-t-10">
                                    <label for="note">Ghi chú</label>
                                    <textarea name="note" id="note" cols="30" rows="10" class=""></textarea>
                                </div>

                                <div class="line-input m-t-10 text-right">
                                    <button type="submit" class="link-action esta-button  btn-small text-center">Lưu danh bạ</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                {% set userSesssion = session.get('USER') %}
                <div style="display: none;">
                    <form action="" id="send_email_contact" class="form-horizontal form-custom" style="width: 320px;">
                        <div class="inner15">
                            <h4 class="title-popup">Gửi mail liên hệ khách hàng</h4>
                            <input type="hidden" name="email" id="email_customer" value="" >
                            <div class="input-line">
                                <div class="input-contact">
                                    <div class="text-label">Tiêu đề</div>
                                    <input placeholder="Nhập Tiêu đề" type="text" name="title" value="" id="title-email" class="form-control" />
                                </div>
                            </div>
                            <div class="input-line">
                                <div class="input-contact">
                                    <div class="text-label">Gửi tin nhắn</div>
                                    <textarea placeholder="Nhập nội dung" name="content" style="height: 100px" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn esta-button btn-small">Gửi liên hệ</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){

            $('.block-header-tab a').click(function(event){
                event.preventDefault();
                var id = $(this).attr('href');

                $('.wrap-list').removeClass('active');
                $(id).addClass('active');

                $('.block-header-tab a').removeClass('active');
                $(this).addClass('active');
            });

            $('.send-mail-customer').on('click', function(){
                $('#email_customer').val($(this).data('email'));
            });

            $('#send_email_contact').on('submit', function(event){
                event.preventDefault();
                $this = $(this);
                $.fancybox.close();
                var data = $this.serialize();
                $.ajax({
                    url: '{{ url({'for': 'send_mail_contact_customer'}) }}',
                    data: data,
                    dataType: 'json',
                    method: 'post',
                    success: function(data){
                    }
                });
            });

            $('.show-info-contact').on('click', function(event){
                event.preventDefault();
                $form = $($(this).attr('href'));

                $this = $(this);
                $.fancybox({
                    content: '<form id="edit-customer" class="form-custom">' + $form.find('form').html() + '</form>'
                });

                json = $this.closest('.item').data('info-customer');

                $form = $(document).find('#edit-customer');

                if (typeof json != 'undefined') {
                    $form.find('.block-avarta').find('.main').attr('src', json.customer.avatar);
                    $form.find('#avatar').attr('src', json.customer.avatar);
                    $form.find('[name="name"]').val(json.customer.name);
                    $form.find('[name="phone"]').val(json.customer.phone);
                    $form.find('[name="email"]').val(json.customer.email);
                    $form.find('[name="address"]').val(json.customer.address);
                    $form.find('[name="gender"]').val(json.customer.gender);
                    $form.find('[name="note"]').val(json.customer.note);
                    $form.append('<input type="hidden" name="id" value="'+ json.id +'" />');
                }
            });

            $('.delete-contact').on('click', function(event) {
                $this = $(this);
                var customerId = $this.data('id');
                $.ajax({
                    url: '{{ url({'for': 'user_delete_contact_ajax'}) }}',
                    data: {customer_id: customerId},
                    dataType: 'json',
                    method: 'post',
                    success: function(data){
                        if (data.status == '{{ constant('\ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS') }}' ) {
                            alert('Xóa danh bạ thành công');
                            window.location.reload();
                        }
                    }
                });
            });

        });

        $(document).on('submit', '#add-customer-user, #edit-customer', function(event){
            event.preventDefault();
            $this= $(this);
            var data = $this.serialize();

            $.ajax({
                url: '{{ url({'for': 'user_add_contact_ajax'}) }}',
                method: "post",
                data: data,
                dataType: 'json',
                success: function(data){
                    if(data.status == '{{ constant('\ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS') }}') {
                        location.reload();
                        return false;
                    } else {
                        alert('Vui lòng kiểm tra lại các thông tin đã nhập');
                    }
                }
            });
        });
    </script>
    <script>
        var url_upload = "{{ url({"for": "load_upload_image_cdn_ajax"}) }}";
    </script>
    <script type="text/javascript"
            src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}upload-avatar-customer.js?{{ config.asset.version }}"></script>
{% endblock %}

