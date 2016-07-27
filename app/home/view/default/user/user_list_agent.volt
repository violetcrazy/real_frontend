{% extends 'default_home.volt' %}

{% block title %}Danh sách đại lý{% endblock %}
{% block description %}Danh sách đại lý{% endblock %}
{% block keywords %}Danh sách đại lý{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.nivo.slider.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}send-email-popup.js?{{ config.asset.version }}"></script>
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'user_list_agent'}) }}" />
{% endblock %}

{% block content %}
    <div class="container m-b-30">
        <div class="single-user">
            <h2 class="title-block title-page">TÌM KIẾM ĐẠI LÝ</h2>
            <div class="list-style2 list-agent">
                <div class="wrap-list">
                    {% if (list_agent['total_items'] > 0) %}
                        {% for item in list_agent['items'] %}
                            <div class="item">
                                <div class="thumbnail">
                                    {% if item['avatar'] is not empty %}
                                        <img src="{{ item['avatar'] }}" alt="{{ item['name'] }}">
                                    {% else %}
                                        {% set avatar = config.asset.frontend_url ~ 'img/noimage.jpg' %}
                                        <img src="{{ avatar }}" alt="{{ item['name'] }}">
                                    {% endif %}
                                </div>
                                <div class="summary">
                                    <h3 class="title">{{ item['name'] }}</h3>
                                    <div class="line-icon">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/icon/ic-phone.png' }}" alt="">
                                        </span>
                                        {% if item['phone'] is not empty %}
                                            {{ item['phone'] }}
                                        {% else %}
                                            Đang cập nhật
                                        {% endif %}
                                    </div>
                                    <div class="line-icon">
                                        <span class="icon">
                                            <img src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/icon/ic_Apartment_20px.png' }}" alt="">
                                        </span>20 Recent Sales
                                    </div>

                                    <a href='{{ url({'for' : 'user_detail', 'id' : item['id']}) }}' class="esta-button btn">Xem chi tiết</a>

                                    <a data-title="{{ item['name'] }}"
                                       data-toggle="modal"
                                       data-target="#email-agent"
                                       aria-hidden="true" data-dismiss="modal"
                                       data-iduser="{{ item['id'] }}"
                                       class="m-l-15 esta-button btn popup-contact">
                                        Liên hệ
                                    </a>

                                    {#<div class="action-item"><span class="text-rating">Rating points</span><span class="value-rating">5.367</span></div>#}
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        {% endfor %}
                    {% else %}
                        <div class="item">
                            Không tìm thấy đại lý nào
                        </div>
                    {% endif %}
                </div>

                {% set result = list_agent %}
                {% if result != null %}
                {% if result['total_pages'] > 1 %}
                    <div class="row text-right">
                        <div class="col-md-12">
                            <div class="dataTables_paginate paging_bootstrap">
                                {% if result['total_items'] > result['limit'] %}
                                    {% set start = (result['current'] - 1) * result['limit'] + 1 %}
                                    {% if ((result['current'] *  result['limit']) > result['total_items']) %}
                                        {% set end = result['total_items'] %}
                                    {% else %}
                                        {% set end = result['current'] *  result['limit'] %}
                                    {% endif %}
                                    <div class="text-cout"> {{ start }} - {{ end }} của {{ result['total_items'] }} kết quả</div>
                                {% else %}
                                    <div class="text-cout">1 - {{ result['total_items'] }} của {{ result['total_items'] }} kết quả</div>
                                {% endif %}

                                <ul class="pagination">
                                    {% if result['before'] == result['current'] %}
                                        <li class="prev">
                                            <a>
                                                <span>Trước</span>
                                            </a>
                                        </li>
                                    {% else %}
                                        <li class="prev">
                                            <a href="{{ url({'for': 'user_list_agent', 'query': '?' ~ http_build_query({'q': q, 'filter': filter, 'page': result.before})}) }}">
                                                <span>Trước</span>
                                            </a>
                                        </li>
                                    {% endif %}

                                    {% if result['current'] == result['last'] %}
                                        {% set start = result['current'] - 4 %}
                                    {% else %}
                                        {% set start = result['current'] - 3 %}
                                    {% endif %}

                                    {% for i in start..result['current'] - 1 %}
                                        {% if i > 0 %}
                                            <li>
                                                <a href="{{ url({'for': 'user_list_agent', 'query': '?' ~ http_build_query({'page': i})}) }}">
                                                    {{ i }}
                                                </a>
                                            </li>
                                        {% endif %}
                                    {% endfor %}

                                    <li class="active">
                                        <a>
                                            {{ result['current'] }}
                                        </a>
                                    </li>

                                    {% if result['current'] == 1 %}
                                        {% set end = result['current'] + 4 %}
                                    {% else %}
                                        {% set end = result['current'] + 3 %}
                                    {% endif %}

                                    {% for i in result['current'] + 1..end %}
                                        {% if i <= result['last'] %}
                                            <li>
                                                <a href="{{ url({'for': 'user_list_agent', 'query': '?' ~ http_build_query({'page': i})}) }}">
                                                    {{ i }}
                                                </a>
                                            </li>
                                        {% endif %}
                                    {% endfor %}

                                    {% if result['next'] == result['current'] %}
                                        <li class="next">
                                            <a>
                                                <span>Sau</span>
                                            </a>
                                        </li>
                                    {% else %}
                                        <li class="next">
                                            <a href="{{ url({'for': 'user_list_agent', 'query': '?' ~ http_build_query({'page': result.next})}) }}">
                                                <span>Sau</span>
                                            </a>
                                        </li>
                                    {% endif %}
                                </ul>
                            </div>
                        </div>
                    </div>
                {% endif %}
                {% endif %}
            </div>
        </div>
    </div>

    <div id="email-agent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
        <div role="document" class="modal-dialog">
            <div style="width: 650px" class="modal-content">
                <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

                <div class="modal-body">
                    <h3 class="title-model">Liên hệ với đại lý</h3>

                    <form class="form-horizontal custom-from" id="send_mail_contact">
                        <input type="hidden" id="user_id" name="id" />
                        <input type="hidden" id="created_by" value="{{ userSession is defined ? userSession['id'] : '' }}" name="created_by" />

                        <div class="row">
                            <div class="col-xs-4">
                                <div class="input-contact">
                                    <div class="text-label">Họ tên</div>
                                    <input placeholder="Nhập họ tên" type="text" id="name" name='name' value="{{ userSession is defined ? userSession['name'] : '' }}" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="input-contact">
                                    <div class="text-label">Số điện thoại</div>
                                    <input placeholder="Nhập số điện thoại" type="text" name="phone" value="{{ userSession is defined ? userSession['phone'] : '' }}" id="phone" class="form-control" />
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="input-contact">
                                    <div class="text-label">Email</div>
                                    <input placeholder="Nhập email" type="text" name="email" value="{{ userSession is defined ? userSession['email'] : '' }}" id="email" class="form-control" />
                                </div>
                            </div>
                        </div>

                        <div class="m-t-15">
                            <div class="input-contact">
                                <div class="text-label">Gửi tin nhắn</div>
                                <textarea placeholder="Nhập nội dung" name="content" rows="5" class="form-control"></textarea>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="form-group submit-button text-center m-t-20">
                            <button type="submit" class="esta-button btn medium">Gửi</button>
                        </div>
                        <div class="text-center">By sending, you agree to <b class="text-danger">Jinn's Terms of Use </b> and <b class="text-danger">Privacy Policy</b></div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var textInput = {
                name: 'Nhập họ tên',
                phone: 'Nhập số điện thoại',
                email: 'Nhập email',
                content: 'Nhập nội dung',
            };

            $('.popup-contact').click(function() {
                var idmodal = $(this).data('target');
                var iduser = $(this).data('iduser');
                $(idmodal).find('#user_id').val(iduser);
            });

            $('#send_mail_contact input, #send_mail_contact textarea').focus(function(){
               $(this).closest('.has-error').removeClass('has-error');
                var name = $(this).attr('name');
                $(this).attr('placeholder', textInput[name]);
            });

            $modalContact = $('#email-agent');

            $modalContact.on('hidden.bs.modal', function (e) {
                $(this).find('form').trigger('reset').find('.has-error').removeClass('has-error');
                $modalContact.find('#name').attr('placeholder', textInput.name);
                $modalContact.find('#phone').attr('placeholder', textInput.phone);
                $modalContact.find('#content').attr('placeholder', textInput.content);
                $modalContact.find('#email').attr('placeholder', textInput.email);
            });

            $('#send_mail_contact').submit(function(event) {
                event.preventDefault();
                var data = $(this).serialize();
                $this = $(this);

                $.ajax({
                    url: '{{ url({ 'for' : 'send_message_ajax' }) }}',
                    data: data,
                    type: 'post',
                    dataType: 'json',
                    success: function(response) {
                        if (typeof response != "undefined") {
                            if (response.status == 200) {
                                var html = '\
                                        <div class="intro-form text-center">\
                                            <h3 class="title-center">Liên hệ đại lý</h3>\
                                            <div class="text-intro">Gửi tin nhắn liên hệ thành công.</div>\
                                            <div class="form-block text-center">\
                                                <a href="" class="esta-button btn">Trở lại trang</a>\
                                            </div>\
                                        </div>';
                                $this.closest('.modal-body').html(html);
                            } else {
                                $this.find('.input-contact').removeClass('has-error');
                                $.each(response.result, function(key, value) {
                                    $this.find('[name="' + key + '"]').val('').attr('placeholder', value).closest('.input-contact').addClass('has-error');
                                });
                            }
                        } else {
                            alert('An unknown error occurred, please try again.');
                        }
                    }
                });
            });
        });
    </script>
{% endblock %}