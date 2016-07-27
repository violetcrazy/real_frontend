{% extends 'mobile_template.volt' %}

{% block title %}{% if systemConfig['meta_title'] is defined %}{{ systemConfig['meta_title'] }}{% endif %}{% endblock %}
{% block description %}{% if systemConfig['meta_description'] is defined %}{{ systemConfig['meta_description'] }}{% endif %}{% endblock %}
{% block keywords %}{% if systemConfig['meta_keywords'] is defined %}{{ systemConfig['meta_keywords'] }}{% endif %}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'project.js?' ~ config.asset.version }}"></script>
{% endblock %}

{% block content %}
    {% set gender = getUserGender() %}
    <div class="block-header-tab layout-2">
        <a href="#wrap-list" class="active item">Khách hàng</a>
        <a href="#add-customer" class="item">Thêm khách hàng</a>
        <div class="clearfix"></div>
    </div>

    <div class="">
        {% if result is defined and result['status'] == constant('\ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS') and result['result']|length > 0 %}
            <div class="main-content wrap-list active search-page" id="wrap-list">
                <div class="list-style2 list-agent">
                    <div class="wrap-list">
                        {% for item in result['result'] %}
                            <div class="item">
                                <div class="thumbnail">
                                    <img src="{{ item['customer']['avatar'] is defined and item['customer']['avatar'] != '' ? item['customer']['avatar'] : '' }}" alt="">
                                    <a class="ranking delete-contact" data-id="{{ item['id'] }}">Xóa liên hệ</a>
                                </div>
                                <div class="summary">
                                    <h3 class="title">{{ item['customer']['name'] is defined ? item['customer']['name'] : '' }}</h3>
                                    <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/icon/ic-user-navigation.png" alt=""></span>{{ item['customer']['gender'] is defined and item['customer']['gender'] != '' ? gender[item['customer']['gender']] : '' }}</div>
                                    <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/icon/ic-mail.png" alt=""></span>{{ item['customer']['email'] is defined and item['customer']['email'] != '' ? item['customer']['email'] : '' }}</div>
                                    <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/icon/ic-phone.png" alt=""></span>{{ item['customer']['phone'] is defined and item['customer']['phone'] != '' ? item['customer']['phone'] : '' }}</div>
                                    <div class="line-icon block"><span class="icon"><img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/icon/ic-home.png" alt=""></span>{{ item['customer']['address'] is defined and item['customer']['address'] != '' ? item['customer']['address'] : '' }}</div>
                                    {% if (item['customer']['email'] is defined and item['customer']['email'] is not empty) %}
                                        <div>
                                            <a href="#send_email_contact" data-email="{{ item['customer']['email'] }}" class="fancybox-run face btn esta-button dis btn-small send-mail-customer">
                                                Liên hệ
                                            </a>
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </div>

            {% if result['total_pages'] is defined and result['total_pages'] > request.getQuery('page') and result['total_pages'] > 1 %}
                {% set page = request.getQuery('page') ? request.getQuery('page') + 1 : 2 %}
                <div class="link-more text-center"><a href="{{ url({'for': 'user_contact', 'query': '?page=' ~ page }) }}" class="link">Xem thêm</a></div>{
            {% endif %}

        {% else %}
            <div class="main-content">
                <div class="alert alert-danger">Chưa có danh bạ khách hàng.</div>
            </div>
        {% endif %}

        <div class="wrap-list main-content search-page" id="add-customer">
            <form action="" id="add-customer-user" class="m-b-20 form-custom">
                <div class="block-avarta m-b-20">
                    <div class="entry">
                        <img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/data-example/avatar-default.png" alt="" class="main">
                        <a href="" class="btn-upload-img">
                            <img src="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/ic-camera.png" alt="" class="icon">
                            Hình đại diện</a>
                        <input type="hidden" class="field-value" id="avatar" name="avatar" value="{{ config.asset.frontend_url }}mobile/version-1.0/template/asset/img/data-example/avatar-default.png">
                    </div>
                    <input style="display:none" name="files" id="upload-avatar" type="file" accept="image/*" class="hidden upload-avatar">
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
                    <input required type="text" name="email" placeholder="Nhập email" class="esta-input">
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

                <div class="line-input m-t-10">
                    <button type="submit" class="link-action esta-button dis block btn-small text-center">Lưu danh bạ</button>
                </div>
            </form>
        </div>
    </div>

    {% set userSesssion = session.get('USER') %}
    <div style="display: none;">
        <form action="" id="send_email_contact" class="form-horizontal form-custom">
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
        </form>
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
                    url: "{{ url({'for': 'send_mail_contact_customer'}) }}",
                    data: data,
                    dataType: 'json',
                    method: 'post',
                    success: function(data){
                    }
                });
            });

            $('#add-customer-user').on('submit', function(event){
                event.preventDefault();
                $this= $(this);
                var data = $this.serialize();

                $.ajax({
                    url: "{{ url({'for': 'user_add_contact_ajax'}) }}",
                    method: "post",
                    data: data,
                    dataType: 'json',
                    success: function(data){
                        if(data.status == '{{ constant('\ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS') }}') {
                            location.reload();
                            return false;
                        } else {
                            alert('Vui lòng kiểm tra Email và họ tên');
                        }
                    }
                })
            });

            $('.delete-contact').on('click', function(event) {
                $this = $(this);
                var customerId = $this.data('id');
                $.ajax({
                    url: "{{ url({'for': 'user_delete_contact_ajax'}) }}",
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
    </script>
    <script>
        var url_upload = '{{ url({"for": "load_upload_image_cdn_ajax"}) }}';
    </script>
    <script type="text/javascript"
            src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}upload-avatar-customer.js?{{ config.asset.version }}"></script>
{% endblock %}
