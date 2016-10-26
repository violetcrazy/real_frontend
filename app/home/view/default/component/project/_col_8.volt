{% set trend = getTrend() %}

<div class="entry">
    <a href="{{ url({'for': 'project_detail', 'slug': _project['slug'], 'id': _project['id']}) }}" class="image-item block">
        {% if _project['default_image'] != '' %}
            <div style="background-image: url({{ config.cdn.dir_upload ~  _project['default_image'] }});" class="fixframe thumb"></div>
        {% else %}
            <div style="background-image: url({{ config.asset.img_default }});" class="fixframe thumb"></div>
        {% endif %}

        <div class="name-project">
            <h3 class="title">{{ _project['name'] }}</h3>
            <div class="des">{{ _project['province']['name'] }}</div>
            <div class="m-t-15">
                <span class="btn esta-button">Xem chi tiết</span>
            </div>
        </div>
        <div class="caption col-xs-6">
            <div class="entry2">
                <div class="line-icon">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url ~  'icon/ic-location.png'}}">
                    </span>
                    <b>
                        {{ _project['address'] is not empty ?  _project['address'] ~ ', ' : '' }}
                        {{ _project['district']['name'] is not empty ? _project['district']['name']  ~ ', ' : '' }}
                        {{ _project['province']['name'] is not empty ? _project['province']['name'] : '' }}
                    </b>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        {% if _project['direction_text'] is not empty %}
                            <div class="line-icon">
                                <span class="icon"><img src="{{ config.asset.frontend_url ~  'icon/ic-orientation-icon.png'}}"></span>
                                <b>{{ _project['direction_text'] }}</b>
                            </div>
                        {% endif %}
                        <div class="line-icon">
                            <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-lanscape-square.png">
                            </span><b>{{ _project['total_area'] }} ha</b>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="line-icon">
                            <span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-square.png"></span>
                            <b>{{ _project['green_area'] }} m<sup>2</sup></b>
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

                        {% if _project['attribute']['view'][0] is defined %}
                            <div class="line-icon">
                                {% if _project['attribute']['view'][0] is defined %}
                                    <span class="icon"></span>
                                {% endif %}
                                {{ _project['attribute']['view'][0] is defined ? _project['attribute']['view'][0]['name'] : '' }}
                            </div>
                        {% endif %}
                    </div>
                    <div class="col-xs-6">
                        {% if _project['attribute']['view'][1] is defined %}
                            <div class="line-icon">
                                {% if _project['attribute']['view'][1] is defined %}
                                    <span class="icon"></span>
                                {% endif %}
                                {{ _project['attribute']['view'][1] is defined ? _project['attribute']['view'][1]['name'] : ''  }}
                            </div>
                        {% endif %}

                        {% if _project['attribute']['view'][2] is defined %}
                            <div class="line-icon">
                                {% if _project['attribute']['view'][2] is defined %}
                                    <span class="icon"></span>
                                {% endif %}
                                {{ _project['attribute']['view'][2] is defined ? _project['attribute']['view'][2]['name'] : ''  }}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <hr>
                <div class="action-bottom text-center">
                    <span class="link">Xem chi tiết</span>
                </div>
            </div>
        </div>
    </a>
</div>
