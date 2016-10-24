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
        <h1 class="title-style1">Hộp thư đến</h1>
        <div class="hr"></div>
        <div class="list-mess">
            {% if listMessage is not empty %}
                {% for item in listMessage['items'] %}
                    <a style="color: #58595b" href="{{ url({'for' : 'message_detail', 'id' : item['message_id'], 'query': '?' ~ http_build_query({'filter': filter}) }) }}" class="item">
                        <div class="name">
                            <div class="pull-left full-name"><b>{{item['name']}}</b></div>
                            <div class="pull-right">
                                <div class="date">{{item['created_at']}}</div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="des">
                            <p><b>{{ item['description'] }}</b></p>
                            <p>{{item['description']}}</p>
                        </div>
                    </a>
                {% endfor %}
            {% else %}
                Chưa có tin nhắn nào
            {% endif %}
        </div>
        {#<div class="link-more text-center m-b-20"><a href="" class="link">Xem thêm (Trang tiếp theo)</a></div>#}
    </div>
{% endblock %}