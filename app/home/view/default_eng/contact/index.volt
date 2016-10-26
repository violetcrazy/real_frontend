{% extends 'default_home.volt' %}

{% block title %}Contact Us{% endblock %}
{% block description %}Contact Us{% endblock %}
{% block keywords %}Contact Us{% endblock %}

{% block top_js %}
{% endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'contact'}) }}" />
{% endblock %}

{% block content %}
    <div class="container m-t-30 m-b-30">
        <h2 class="title-block title-page">Contact Us</h2>
        <div class="row">
            <div class="col-xs-6">
                <div id="login-alert-message">
                    {% if response['status'] is defined and response['status'] == 400 %}
                        <div class="alert alert-danger">
                            {{ response['message'] }}
                        </div>
                    {% endif %}

                    {% if response['status'] is defined and response['status'] == 200 %}
                        <div class="alert alert-success">
                            {{ response['message'] }}
                        </div>
                    {% endif %}
                </div>

                <form class="form-contact" method="POST" action="{{ url({'for': 'contact'}) }}" enctype="multipart/form-data">
                    <div class="form-group {{ response['result']['name'] is defined ? 'has-error' : '' }}"><small>Fullname</small>
                        <input name="name" placeholder="{{ response['result']['name'] is defined ? response['result']['name'] : 'Fullname' }}" value="{{ post['name'] is not empty ? post['name'] : '' }}" class="form-control">
                    </div>
                    <div class="form-group {{ response['result']['email'] is defined ? 'has-error' : '' }}"><small>Email</small>
                        <input name="email" placeholder="{{ response['result']['email'] is defined ? response['result']['email'] : 'Email' }}" value="{% if response['result']['email'] is not defined and post['email'] is not empty  %} {{ post['name'] }} {% endif %}" class="form-control">
                    </div>
                    <div class="form-group {{ response['result']['title'] is defined ? 'has-error' : '' }}"><small>Title</small>
                        <input name="title" placeholder="{{ response['result']['title'] is defined ? response['result']['title'] : 'Title' }}" value="{{ post['name'] is not empty ? post['title'] : '' }}" class="form-control">
                    </div>
                    <div class="form-group {{ response['result']['content'] is defined ? 'has-error' : '' }}"><small>Content</small>
                        <textarea name="content" placeholder="{{ response['result']['content'] is defined ? response['result']['content'] : 'Content' }}" cols="4" class="form-control">{{ post['content'] is not empty ? post['content'] : '' }}</textarea>
                    </div>

                    <p class="clearfix"></p>
                    <div class="action-bottom text-center">
                        <button type="submit" id="send-mail" class="btn esta-button">Send</button>
                    </div>
                </form>
            </div>

            <div class="col-xs-5 col-xs-push-1">
                <p class="m-t-15">
                    <b class="text-danger">HANOI</b>
                    <br />
                    R4 Building, Royal City Residence,
                    <br />
                    72A Nguyễn Trai, Thanh Xuan Dist., Hanoi
                </p>

                <hr />
                <p>
                    <b class="text-danger">HOCHIMINH CITY</b>
                    <br />
                    17-19 Ton That Tung, Pham Ngu Lao, District 1, TP.HCM
                </p>

                <hr />
                <p>
                    <b class="text-danger">TEL:</b>
                    <br />
                    <b>HCMC:</b> (08) 6689 3838
                    <br />
                    <b>HANOI:</b> 093 996 07 07
                </p>
            </div>
        </div>
    </div>
{% endblock %}
