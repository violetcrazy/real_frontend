{% set childrenSearch = getChildrenSearch() %}
{% set adultSearch = getAdultSearch() %}
{% set typeSearch = getTypeSearch() %}
{% set minRoomSearch = getMinRoomSearch() %}
{% set maxRoomSearch = getMaxRoomSearch() %}

<div class="box-widget n-m">
    <h3 class="title-widget">Công cụ tìm kiếm</h3>

    <div class="content-widget">
        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="type" name="type" value="{{ type }}" />
                <button type="button" id="type-project" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">
                        {% if typeSearch[type] is defined %}
                            {{ typeSearch[type] }}
                        {% else %}
                            Tất cả
                        {% endif %}
                    </span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in typeSearch %}
                        {% if type is defined and type == key %}
                            <li class="active">
                                <a href="" data-value="{{ key }}">{{ item }}</a>
                            </li>
                        {% else %}
                            <li>
                                <a href="" data-value="{{ key }}">{{ item }}</a>
                            </li>
                        {% endif %}
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="location1" name="location" />
                <button type="button" id="location" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Dự án</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li>
                        <a href="" data-value="">Dự án</a>
                    </li>
                    {% for key, item in list_by_province %}
                        {% if item|length == 1 %}
                            {% set _class = "" %}
                            {% if location == 'p-' ~ item[0]['id'] %}
                                {% set _class = "active" %}

                                <script type="text/javascript">
                                    document.getElementById('location').innerHTML = '<span class="text">{{ item[0]['province']['name'] }} - {{ item[0]['name'] }}</span><span class="arrow"></span>';
                                    document.getElementById('location1').value = '{{ location }}';
                                </script>
                            {% endif %}

                            <li class="{{ _class }}">
                                <a href="" data-value="p-{{ item[0]['id'] }}">
                                    {{ item[0]['province']['name'] ~ ' - ' ~ item[0]['name'] }}
                                </a>
                            </li>
                        {% else %}
                            {% set _class = "" %}

                            {% if location == item[0]['province']['id'] %}
                                {% set _class = "active" %}

                                <script type="text/javascript">
                                    document.getElementById('location').innerHTML = '<span class="text">{{ item[0]['province']['name'] }}</span><span class="arrow"></span>';
                                    document.getElementById('location1').value = '{{ location }}';
                                </script>
                            {% endif %}

                            <li class="has-sub {{ _class }}">
                                <a href="" data-value="{{ item[0]['province']['id'] }}">
                                    {{ item[0]['province']['name'] }}
                                </a>
                                <ul class="sub-select">
                                    {% for sub_item in item %}
                                        {% set _class1 = "" %}
                                        {% if location == 'p-' ~ sub_item['id'] %}
                                            {% set _class1 = "active" %}

                                            <script type="text/javascript">
                                                document.getElementById('location').innerHTML = '<span class="text">{{ key ~ ' - ' ~ sub_item['name'] }}</span><span class="arrow"></span>';
                                                document.getElementById('location1').value = '{{ location }}';
                                            </script>
                                        {% endif %}

                                        <li class="{{ _class1 }}">
                                            <a href="" data-value="p-{{ sub_item['id'] }}">
                                                {{ key ~ ' - ' ~ sub_item['name'] }}
                                            </a>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </li>
                        {% endif %}
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="adultSearch" name="adults" value="1" />
                <button type="button" id="adults" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Người lớn</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in adultSearch %}
                        {% set _class = "" %}
                        {% if adults == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('adults').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('adultSearch').value = '{{ adults }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="childrenSearch" name="children" value="1" />
                <button type="button" id="children" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Trẻ em</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in childrenSearch %}
                        {% set _class = "" %}
                        {% if children == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('children').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('childrenSearch').value = '{{ children }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="room_search_min" name="bedroom_min" value="" />
                <button type="button" id="room_min" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Min Beds</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in minRoomSearch %}
                        {% set _class = "" %}
                        {% if bedroomMin == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('room_min').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('room_search_min').value = '{{ bedroomMin }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="room_search_max" name="bedroom_max" value="" />
                <button type="button" id="room_max" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Max Beds</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in maxRoomSearch %}
                        {% set _class = "" %}
                        {% if bedroomMax == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('room_max').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('room_search_max').value = '{{ bedroomMax }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="price_search_min" name="price_min" value="" />
                <button type="button" id="price_min" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Min Price</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in prices['min_price'] %}
                        {% set _class = "" %}
                        {% if priceMin == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('price_min').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('price_search_min').value = '{{ priceMin }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="price_search_max" name="price_max" value="" />
                <button type="button" id="price_max" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Max Price</span>
                    <span class="arrow"></span>
                </button>

                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in prices['max_price'] %}
                        {% set _class = "" %}
                        {% if priceMax == key %}
                             {% set _class = "active" %}

                             <script type="text/javascript">
                                 document.getElementById('price_max').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('price_search_max').value = '{{ priceMax }}';
                             </script>
                        {% endif %}

                        <li class="{{ _class }}">
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <input type="text" class="form-control input-small" placeholder="Số tầng" name="floor" value="{{ floor }}" />
        </div>

        <div class="clearfix"></div>
        <div class="text-center group-form m-t-15">
            <button class="btn esta-button">Tìm kiếm</button>
        </div>
    </div>
</div>
