{% set getTrend = getTrend() %}

<div class="row-section">
    <div class="container">
        <h2 class="title-block">DỰ ÁN</h2>
        <div class="list-post1">
            {% if project[0] is defined %}
                <div class="item item-3">
                    {% set _project = project[0] %}
                    {% include '/default/component/project/_col_12.volt' %}
                    {% set _project = '' %}
                </div>
            {% endif %}

            <div class="row">
                {% if project[1] is defined %}
                    <div class="item item-2 col-xs-8">
                        {% set _project = project[1] %}
                        {% include '/default/component/project/_col_8.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[2] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[2] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}
            </div>

            <div class='row'>
                {% if project[3] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[3] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[4] is defined %}
                    <div class="item item-2 col-xs-8">
                        {% set _project = project[4] %}
                        {% include '/default/component/project/_col_8.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}
            </div>

            <div class='row'>
                {% if project[5] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[5] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[6] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[6] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[7] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[7] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}
            </div>

            <div class='row'>
                {% if project[8] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[8] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[9] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[9] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}

                {% if project[10] is defined %}
                    <div class="item item-1 col-xs-4">
                        {% set _project = project[10] %}
                        {% include '/default/component/project/_col_4.volt' %}
                        {% set _project = '' %}
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>
