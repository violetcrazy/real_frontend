{% extends 'mobile_template.volt' %}

{% block title %}Đăng nhập{% endblock %}
{% block description %}Đăng nhập{% endblock %}
{% block keywords %}Đăng nhập{% endblock %}
{% block top_js %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'project.js?' ~ config.asset.version }}"></script>
{% endblock %}
{% block content %}
    <div class="block-header-tab layout-2"><a href="{{ url({ 'for' : 'agent_login' }) }}" class="active item">Đại lý</a><a
                href="{{ url({ 'for' : 'user_login' }) }}" class="item">Người dùng</a>

        <div class="clearfix"></div>
    </div>
    <div class="main-content">
        <div class="form-custom m-t-15">
            <h1 class="title-style1">Đăng nhập</h1>

            <form id="form_signin">
                <div id="login-alert-message"></div>
                <div class="line-input form-group">
                    <label>Email</label>
                    <input type="text" name="username" id="username" placeholder="Email"
                           class="esta-input form-control">
                </div>
                <div class="line-input form-group m-t-10">
                    <label>Mật khẩu</label>
                    <input type="password" name="password" id="password" placeholder="Nhập mật khẩu"
                           class="esta-input form-control">
                </div>
                <div class="line-input m-t-10">
                    <div class="pull-left">
                        <label for="remember" class="custom-checkbox">
                            <input type="checkbox" id="remember"><span class="mark"></span>Ghi nhớ đăng nhập
                        </label>
                    </div>
                    <div class="pull-right"><a href="{{ url({ 'for' : 'forgot_password' }) }}" class="text-danger">Quên mật khẩu</a></div>
                    <div class="clearfix"></div>
                </div>
                <div class="action-bottom m-t-10 m-b-10">
                    <button type="submit" class="btn link-action esta-button block btn-small m-t-10" id="save-search">
                        Đăng nhập
                    </button>
                </div>
                <div class="text-center m-b-20">Don't have an account? &#160<a href="{{ url({ 'for' : 'agent_register' }) }}"><b class="text-danger">Sign up</b></a></div>
            </form>
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
        $(document).ready(function () {
            $(document).on('submit', '#form_signin', function (event) {
                event.preventDefault();
                $this = $(this);
                var data = $this.serialize();

                $.ajax({
                    url: url_signin_ajax,
                    data: data,
                    type: 'POST',
                    success: function (response) {
                        if (typeof response != "undefined") {
                            if (response.status == 200) {
                                window.location.href = response.result.referral_url;
                            } else {
                                var html = '<div class="alert alert-danger">' + response.message + '</div>';

                                $("#login-alert-message").html(html).show();
                                $this.find('.form-group').removeClass('has-error');

                                if (typeof response.result != "undefined") {
                                    $.each(response.result, function (key, value) {
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
        });
    </script>
{% endblock %}