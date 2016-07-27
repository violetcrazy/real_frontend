<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>{% block title %}{% endblock %}</title>
        <meta name="description" content="{% block description %}{% endblock %}" />
        <meta name="keywords" content="{% block keywords %}{% endblock %}" />
        <meta name="robots" content="index, follow" />

        {% include '_default_asset.volt' %}

        {% block top_meta %}{% endblock %}
        {% block top_css %}{% endblock %}
        {% block top_js %}{% endblock %}
    </head>
    <body>
        {{ headerBlock }}
        {{ formRegister }}
        <div class="block-search search-home">
            <div class="container">
                {{ searchBlock }}
            </div>
        </div>
        {% block breadcrumbs %}{% endblock %}
        {% block content %}{% endblock %}

        {{ footerBlock }}
        {% block bottom_js %}{% endblock %}
    </body>
</html>