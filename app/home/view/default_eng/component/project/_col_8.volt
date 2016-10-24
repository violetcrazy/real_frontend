{% set trend = getTrend() %}

<div class="entry">
    <a href="{{ url({'for': 'project_detail', 'slug': _project['slug'], 'id': _project['id']}) }}" class="image-item block">
        {% if _project['default_image'] != '' %}
            <div style="background-image: url({{ config.cdn.dir_upload ~  _project['default_image'] }});" class="fixframe thumb">
            </div>
        {% else %}
            <div style="background-image: url({{ config.asset.img_default }});" class="fixframe thumb">
            </div>
        {% endif %}
        <div class="name-project">
            <h3 class="title">{{ _project['name_eng'] }}</h3>
            <div class="des">{{ _project['province']['name'] }}</div>
            <div class="m-t-15">
                <span class="btn esta-button">View detail</span>
            </div>
        </div>
        <div class="caption col-xs-6">
            <div class="entry2">
                <div class="line-icon">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url ~  'icon/ic-location.png'}}">
                    </span>
                    <b>
                        {{ _project['address_eng'] is not empty ?  _project['address_eng'] ~ ', ' : '' }}
                        {{ _project['district']['name'] is not empty ? _project['district']['name']  ~ ', ' : '' }}
                        {{ _project['province']['name'] is not empty ? _project['province']['name'] : '' }}
                    </b>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        {% if trend[_project['property_trend']] is defined %}
                            <div class="line-icon">
                                <span class="icon"><img src="{{ config.asset.frontend_url ~  'icon/ic-orientation-icon.png'}}"></span>
                                <b>{{ trend[_project['property_trend']] }}</b>
                            </div>
                        {% endif %}
                        <div class="line-icon">
                            <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-lanscape-square.png">
                            </span><b>{{ currencyFormat(_project['area']) }} ha</b>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="line-icon">
                            <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-square.png"></span>
                            <b>{{ currencyFormat(_project['space']) }} m<sup>2</sup></b>
                        </div>
                        <div class="line-icon">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url }}icon/ic-area.png"></span>
                            <b>Area: {{ currencyFormat(_project['apartment_count']) }}</b>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="line-icon">
                            <span class="icon">
                                <img src="{{ config.asset.frontend_url ~  'icon/ic-view.png'}}">
                            </span>
                            <b>View</b>
                        </div>

                        {% if _project['property_view_eng'][0] is defined %}
                            <div class="line-icon">
                                {% if _project['property_view_eng'][0] is defined %}
                                    <span class="icon">
                                        <img src="{{ _project['property_view_eng'][0]['image_one_url']  }}">
                                    </span>
                                {% endif %}
                                {{ _project['property_view_eng'][0] is defined ? _project['property_view_eng'][0]['name'] : '' }}
                            </div>
                        {% endif %}
                    </div>
                    <div class="col-xs-6">
                        {% if _project['property_view_eng'][1] is defined %}
                        <div class="line-icon">
                            {% if _project['property_view_eng'][1] is defined %}
                                <span class="icon">
                                    <img src="{{ _project['property_view_eng'][1]['image_one_url'] }}">
                                </span>
                            {% endif %}

                            {{ _project['property_view_eng'][1] is defined ? _project['property_view_eng'][1]['name'] : ''  }}
                        </div>
                        {% endif %}
                        {% if _project['property_view_eng'][2] is defined %}
                        <div class="line-icon">
                            {% if _project['property_view_eng'][2] is defined %}
                                <span class="icon">
                                    <img src="{{ _project['property_view_eng'][2]['image_one_url'] }}">
                                </span>
                            {% endif %}
                            {{ _project['property_view_eng'][2] is defined ? _project['property_view_eng'][2]['name'] : ''  }}
                        </div>
                        {% endif %}
                    </div>
                </div>
                <hr>
                <div class="action-bottom text-center">
                    <span class="link">View detail</span>
                </div>
            </div>
        </div>
    </a>
</div>
