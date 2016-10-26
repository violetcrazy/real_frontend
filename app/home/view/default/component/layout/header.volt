{% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

<div class="top-header">
    <div class="container">
        <div class="pull-left item-dropdown">
            <div class="dropdown custom-select menu">
                <input type="hidden" name="en"/>
                <button type="button" id="en" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">VI</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li><a href="{{ urlCurrent }}eng" data-value="en">ENG</a></li>
                    <li class="active"><a>VI</a></li>
                </ul>
            </div>
        </div>
        {#
        <div class="pull-left item-dropdown">
            <div class="dropdown custom-select menu">
                <input type="hidden" name="vnd"/>
                <button type="button" id="vnd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">VND</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li><a href="" data-value="usd">USD</a></li>
                    <li><a href="" data-value="vnd">VND</a></li>
                </ul>
            </div>
        </div>
        #}

        {% if userSession is not defined %}
            <div class="pull-right item-dropdown login">
                <a href="" data-toggle="modal" id="link-login" data-target="#login">Đăng ký / Đăng nhập</a>
            </div>
        {% endif %}

        {% if userSession is not empty %}
            {% set controllerName = router.getControllerName() %}
            {% set actionName = router.getActionName() %}

            <div class="pull-right item-dropdown user">
                <div class="dropdown custom-select menu">
                    <input type="hidden" name="name" />
                    <button type="button" id="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                        <span class="text">{{ userSession['name'] }}</span>
                        <span class="arrow"></span>
                    </button>

                    <ul aria-labelledby="type-project" class="dropdown-menu">
                        {% if controllerName == 'user' and actionName == 'profile' %}
                            <li>
                                <a href="{{ url({'for': 'user_profile'}) }}" class="active">
                                    Thông tin cá nhân
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_profile'}) }}">
                                    Thông tin cá nhân
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'user' and actionName == 'purchasedProperties' %}
                            <li>
                                <a href="{{ url({'for': 'user_purchased_properties'}) }}" class="active">
                                    Purchased Properties
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_purchased_properties'}) }}">
                                    Purchased Properties
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'user' and actionName == 'saveHome' %}
                            <li>
                                <a href="{{ url({'for': 'user_save_home'}) }}" class="active">
                                    Căn hộ đã lưu
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_save_home'}) }}">
                                    Căn hộ đã lưu
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'user' and actionName == 'saveSearch' %}
                            <li>
                                <a href="{{ url({'for': 'user_save_search'}) }}" class="active">
                                    Kết quả tìm kiếm đã lưu
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_save_search'}) }}">
                                    Kết quả tìm kiếm đã lưu
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'user' and actionName == 'message' %}
                            <li>
                                <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}" class="active">
                                    Tin nhắn
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_message', 'query': '?' ~ http_build_query({'filter': 'inbox'}) }) }}">
                                    Tin nhắn
                                </a>
                            </li>
                        {% endif %}

                        {% if controllerName == 'user' and actionName == 'edit' %}
                            <li>
                                <a href="{{ url({'for': 'user_edit'}) }}" class="active">
                                    Cài đặt
                                </a>
                            </li>
                        {% else %}
                            <li>
                                <a href="{{ url({'for': 'user_edit'}) }}">
                                    Cài đặt
                                </a>
                            </li>
                        {% endif %}

                        <li>
                            <a href="{{ url({'for': 'user_logout'}) }}">
                                Đăng xuất
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="pull-right item-dropdown">
                <a class="notify">
                    <span class="icon-notify icon"></span>
                    <span class="count">{{ countMessage }}</span>
                </a>
            </div>

            <div class="pull-right item-dropdown">
                <a class="notify">
                    <span class="icon-home icon"></span>
                    {#<span class="count">3</span>#}
                </a>
            </div>
        {% endif %}
    </div>
</div>

{% set controllerName = router.getControllerName() %}
{% set actionName = router.getActionName() %}

<div class="header header-site">
    <div class="container">
        <div class="logo pull-left">
            <a href="{{ url({'for': 'home'}) }}">
                <img src="{{ img_dir }}logo.png?{{ config.asset.version }}" alt="" />
            </a>
        </div>

        <div class="main-menu pull-right">
            <div class="wrap-menu">
                <ul class="menu">
                    {% if controllerName == 'project' and actionName == 'list' %}
                        <li>
                            <a href="{{ url({'for': 'project_list'}) }}" class="active">
                                DỰ ÁN
                            </a>
                        </li>
                    {% else %}
                        <li>
                            <a href="{{ url({'for': 'project_list'}) }}">
                                DỰ ÁN
                            </a>
                        </li>
                    {% endif %}

                    {% if controllerName == 'apartment' and actionName == 'buy' %}
                        <li>
                            <a href="{{ url({'for': 'apartment_buy'}) }}" class="active">
                                CẦN BÁN
                            </a>
                        </li>
                    {% else %}
                        <li>
                            <a href="{{ url({'for': 'apartment_buy'}) }}">
                                CẦN BÁN
                            </a>
                        </li>
                    {% endif %}

                    {% if controllerName == 'apartment' and actionName == 'rent' %}
                        <li>
                            <a href="{{ url({'for': 'apartment_rent'}) }}" class="active">
                                CHO THUÊ
                            </a>
                        </li>
                    {% else %}
                       <li>
                           <a href="{{ url({'for': 'apartment_rent'}) }}">
                               CHO THUÊ
                           </a>
                       </li>
                    {% endif %}

                    {% if controllerName == 'user' and actionName == 'listAgent' %}
                        <li>
                            <a href="{{ url({'for': 'user_list_agent'}) }}" class="active">
                                TÌM ĐẠI LÝ
                            </a>
                        </li>
                    {% else %}
                        <li>
                            <a href="{{ url({'for': 'user_list_agent'}) }}">
                                TÌM ĐẠI LÝ
                            </a>
                        </li>
                    {% endif %}

                    {% if controllerName == 'article' and actionName == 'listByCategory' %}
                        <li>
                            <a href="{{ url({'for': 'article_list_news'}) }}" class="active">
                                TIN TỨC
                            </a>
                        </li>
                    {% else %}
                        <li>
                            <a href="{{ url({'for': 'article_list_news'}) }}">
                                TIN TỨC
                            </a>
                        </li>
                    {% endif %}

                    {% if controllerName == 'contact' and actionName == 'index' %}
                        <li>
                            <a href="{{ url({'for': 'contact'}) }}" class="active">
                                LIÊN HỆ
                            </a>
                        </li>
                    {% else %}
                        <li>
                            <a href="{{ url({'for': 'contact'}) }}">
                                LIÊN HỆ
                            </a>
                        </li>
                    {% endif %}
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
    <div role="document" class="modal-dialog">
        <div style="width: 650px" class="modal-content">
            <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

            <div class="modal-body">
                <h3 class="title-model">Đăng nhập</h3>

                <form id="form_signin" class="form-horizontal custom-from">
                    <div class="form-block">
                        <div id="login-alert-message"></div>
                        <div class="form-group username">
                            <label for="frist-name" class="col-xs-2 control-label">Email</label>
                            <div class="col-xs-10">
                                <input type="text" name="username" id="username" placeholder="Email" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Mật khẩu</label>
                            <div class="col-xs-10">
                                <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group text-left checkbox-left">
                            <div class="col-xs-10 col-xs-push-2">
                                <label for="remember" class="custom-checkbox">
                                    <input type="radio" name="remember_me" id="remember" />
                                    <span class="mark"></span>
                                    <span class="text">Lưu mật khẩu này</span>
                                </label>
                                <a href="" data-toggle="modal" data-target="#forgot" aria-hidden="true" data-dismiss="modal" class="text-danger link-forgot-pass">
                                    Quên mật khẩu?
                                </a>
                            </div>
                        </div>

                        <div class="form-group submit-button text-center">
                            <button type="submit" class="esta-button btn medium">Đăng nhập</button>
                        </div>

                        <div class="text-center">
                            Chưa có tài khoản
                            <a href="" data-toggle="modal" data-target="#logup" aria-hidden="true" data-dismiss="modal" class="text-danger">
                                <b>Đăng kí ngay</b>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="forgot" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
    <div role="document" class="modal-dialog">
        <div style="width: 650px" class="modal-content">
            <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

            <div class="modal-body">
                <form id="form_forgot" class="form-horizontal custom-from">
                    <div class="intro-form text-center">
                        <h3 class="title-center">Gửi lại mật khẩu</h3>
                        <div class="text-intro">
                            Xin vui lòng nhập vào địa chỉ email bạn đã sử dụng để đăng kí tài khoản.
                            Chúng tôi sẽ gửi đường link kích hoạt lại mật khẩu cho bạn.
                        </div>
                    </div>
                    <div class="form-block">
                        <div id="forgot-password-alert-message"></div>
                        <div class="form-group forgot-password">
                            <label for="email" class="col-xs-2 control-label">Email</label>
                            <div class="col-xs-10">
                                <input type="email" name="email" id="email" placeholder="Nhập email" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group submit-button text-center">
                            <button type="submit" class="esta-button btn medium">Gửi link xác nhận</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var url_signin_ajax = '{{ url({'for': 'user_sign_in_ajax'}) }}';
    var url_signup_ajax = '{{ url({'for': 'user_sign_up_ajax'}) }}';
    var url_forgot_ajax = '{{ url({'for': 'user_forgot_password_ajax'}) }}';
    var url_profile = '{{ url({'for': 'user_profile'}) }}';
    var url_home = '{{ url({'for': 'home'}) }}';
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('submit', '#form_signin', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_signin_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                            window.location.href = response.result.referral_url;
                        } else {
                            var html = '<div class="alert alert-danger">' + response.message + '</div>';

                            $("#login-alert-message").html(html).show();
                            $this.find('.form-group').removeClass('has-error');

                            if (typeof response.result != "undefined") {
                                $.each(response.result, function(key, value){
                                    $this.find('[name="' + key + '"]').val('').attr('placeholder', value).closest('.form-group').addClass('has-error');
                                });
                            }
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            });
        });

        $(document).on('submit', '#form_signup', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_signup_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                             $this.fadeOut('fast', function() {
                                var html = '\
                                    <div class="intro-form text-center">\
                                        <h3 class="title-center">Cảm ơn bạn đã đăng ký!</h3>\
                                        <p class="text-intro">Bây giờ bạn đã có thể truy cập vào mọi dịch vụ của Jinn.</p>\
                                        <br />\
                                        <div class="form-block text-center">\
                                            <a href="' + url_home + '" class="esta-button btn">Về trang chủ </a>&#160 &#160\
                                            <a href="' + url_profile + '" class="esta-button btn">Về trang cá nhân</a>\
                                        </div>\
                                    </div>';

                                $this.closest('.modal-body').html(html);
                            });
                        } else {
                            $("#form_signin #error_phone").text("").hide();
                            $this.find('.form-group').removeClass('has-error');

                            $.each(response.result, function(key, value){
                                $this.find('[name="' + key + '"]').attr('placeholder', value).closest('.form-group').addClass('has-error');
                            });
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }

                }
            });
        });

        $(document).on('submit', '#form_forgot', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_forgot_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                             var html = '\
                                <div class="intro-form text-center">\
                                    <h3 class="title-center">Bạn đã reset mật khẩu thành công!</h3>\
                                    <p class="text-intro">Chúng tôi đã gửi cho bạn email. Vui lòng kiểm tra email để lấy lại mật khẩu.</p>\
                                    <br />\
                                    <div className="form-block text-center">\
                                        <a href="" class="esta-button btn">Quay trở lại</a>\
                                    </div>\
                                </div>';

                            $this.closest('.modal-body').html(html);
                        } else {
                            var html = '<div class="alert alert-danger">' + response.message + '</div>';
                            $("#forgot-password-alert-message").html(html).show();
                            $(".forgot-password").addClass('has-error');
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            });
        });
    });
</script>