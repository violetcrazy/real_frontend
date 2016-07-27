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
        <div class="detail-mess">
            <div class="header-mess">
                {% if user['avatar'] is not empty %}
                    {% set avatar = user['avatar'] %}
                {% else %}
                    {% set avatar = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/data-example/avatar.png' %}
                {% endif %}
                <div class="avatar"><img src="{{ avatar }}" alt=""></div>
                <div class="summary">
                    <div class="name"><b>{{ message['name'] }}</b></div>
                    <div><small>gửi đến tôi</small></div>
                </div>
                <div class="block-link"><a href="" class="prev"></a><a href="" class="next"></a></div>
            </div>
            <div class="content">
                {#<p><b>Chủ đề mail</b></p>#}
                <p>{{ message['description'] }}</p>
            </div>
            {#<div class="action-bottom m-t-10 m-b-10"><a href="" class="link-action esta-button block btn-small text-center">Trả lời</a><br><a href="" class="link-action esta-button dis block btn-small text-center">Xóa</a></div>#}
        </div>
    </div>
{% endblock %}