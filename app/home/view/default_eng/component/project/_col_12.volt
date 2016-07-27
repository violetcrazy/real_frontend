<div class="entry">
    <a href="{{ url({'for': 'project_detail', 'slug': _project['slug'], 'id': _project['id']}) }}" class="image-item block">
        <div class="row">
            <div class="col-xs-8 pull-right">
                {% if _project['default_image'] != '' %}
                    <div style="background-image: url({{ config.cdn.dir_upload ~  _project['default_image'] }});" class=" fixframe thumb">
                    </div>
                {% else %}
                    <div style="background-image: url({{ config.asset.img_default }});" class=" fixframe thumb">
                    </div>
                {% endif %}
            </div>
            <div class="clearfix"></div>
            <div class="caption col-xs-4">
                <div class="entry2">
                    <div class="key-sale"></div>
                    <h3 class="title-project">{{ _project['name'] }}</h3>
                    <div class="localtion">{{ _project['province_name'] }}</div>

                    <div class="action-bottom text-center">
                        <span class="btn esta-button">
                            View detail
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </a>
</div>