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
      <form id="fogot-password" class="form-custom" method="POST" enctype="multipart/form-data">
        <h1 class="title-style1">Quên mật khẩu</h1>
        <div class="line-input">
          <label class="m-b-10">Nhập vào email bạn đã dùng để đăng ký tài khoản. Mật khẩu mới sẽ được gửi về cho email này.</label>
          <label>Email</label>
          <input name="email" type="text" placeholder="Email" class="esta-input">
        </div>
        <div class="action-bottom m-t-10 m-b-20"><button type="submit" class="link-action esta-button block btn-small text-center">Gửi mật khẩu</button></div>
      </form>
    </div>
    <script>
    var r = '{{ status }}';
        var rs = JSON.parse('{{ result }}');
        if (r == '400') {
            $('#fogot-password').find('.form-group').removeClass('has-error');
            
            $.each(rs, function(key, value){
                 $('#fogot-password')
                         .find('[name="' + key + '"]')
                         .attr('placeholder', value)
                         .closest('.line-input')
                         .addClass('has-error');
            });
         }
    </script>
{% endblock %}