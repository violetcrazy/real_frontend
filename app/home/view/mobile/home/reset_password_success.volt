{% extends 'mobile_template.volt' %}

{% block title %}Quên mật khẩu{% endblock %}
{% block description %}Quên mật khẩu{% endblock %}
{% block keywords %}Quên mật khẩu{% endblock %}
{% block top_js %}
    <script type="text/javascript" src="{{ js_dir ~ 'swiper.js?' ~ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ js_dir ~ 'project.js?' ~ config.asset.version }}"></script>
{% endblock %}
{% block content %}
    <div class="main-content">
        <h1 class="title-style1">Reset password thành công</h1>
        <div class="line-input">
          <label class="m-b-10">Mật khẩu mới được gửi về cho email của bạn. Vui lòng check email để lấy lại mật khẩu</label>
        </div>
        <div class="action-bottom m-t-10 m-b-20"><a href="{{ url({ 'for' : 'home' }) }}" class="link-action esta-button block btn-small text-center">Quay về trang chủ</a></div>
    </div>
{% endblock %}