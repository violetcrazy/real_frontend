{% extends 'mobile_template.volt' %}

{% block title %}Profile{% endblock %}
{% block description %}Profile{% endblock %}
{% block keywords %}Profile{% endblock %}
{% block content %}
    {% set date_register = date('d-m-Y',  strtotime(user['created_at'])) %}
    {% set birthday = date('d-m-Y',  strtotime(user['birthday'])) %}
    <div class="main-content">
        <h2 class="title-style1">Thông tin cơ bản</h2>

        <div class="basic-info">
            <h3 class="user-name">{{ user['firstname'] ~ ' ' ~ user['name'] }}<span
                        class="des-inline">(Ngày tham gia: {{ date_register }})</span></h3>

            <div class="line-info"><span class="text-label">Password:</span><span class="value">********</span></div>
            <div class="line-info"><span class="text-label">Ngày sinh:</span><span class="value">{{ birthday }}</span>
            </div>
            <div class="line-info"><span class="text-label">Email:</span><span class="value">{{ user['email'] }}</span>
            </div>
            <div class="line-info"><span class="text-label">Điện thoại:</span><span
                        class="value">{{ user['phone'] }}</span></div>
            <div class="line-info"><span class="text-label">Địa chỉ:</span><span
                        class="value">{{ user['address'] }}</span></div>
            <div class="line-info"><span class="text-label">Quốc tịch</span><span class="value">Việt Nam</span></div>
            <div class="line-info"><span class="text-label">Công việc</span><span
                        class="value">{{ user['job_title'] }}</span></div>
            <div class="hr"></div>
            <div class="des-user">Your Application Information is only shared with landlords and real estate agents who
                you contact, and will not be shown on your public profile.
            </div>
        </div>
        <div class="action-bottom m-t-15 m-b-20"><a href="{{ url({ 'for' : 'user_edit' }) }}"
                                                    class="link-action esta-button dis block btn-small text-center">Sửa</a>
        </div>
        <div class="clearfix"></div>
    </div>
{% endblock %}