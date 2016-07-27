<div class="main-content">
    <div class="body-building">
        <div class="building-content">
            {% set apartment_name_list = blocks['apartment_name_list']|json_decode(true) %}
            {% set floor_name_list = blocks['floor_name_list']|json_decode(true) %}
            {% set getApartmentConditionClass = getApartmentConditionClass() %}

            {% for floor in 1..blocks['floor_count'] %}
                <div class="wrap">
                    <div class="header-table">
                    <span>
                        {{ floor_name_list[floor] is defined and floor_name_list[floor] ? floor_name_list[floor] : 'Tầng ' ~ floor }}
                    </span>
                    </div>

                    {% for apartment in 1..blocks['apartment_count']%}
                        {% set indexApartment = loop.index %}
                        {% set apartmentName = apartment_name_list[indexApartment] is defined and apartment_name_list[indexApartment] is not empty ?  apartment_name_list[indexApartment]  : indexApartment %}

                        {% if blocks['apartment'][floor] is defined and blocks['apartment'][floor]|length %}

                            {% set check = false %}
                            {% for apartment_detail in blocks['apartment'][floor] %}
                                {% if (apartment_detail['ordering'] == apartment) %}
                                    <div class="item {{ getApartmentConditionClass[apartment_detail['condition']] }}">
                                        <a href="{{ url({'for': 'apartment_detail', 'slug': apartment_detail['slug'], 'id': apartment_detail['id']}) }}">
                                            <span data-id="{{apartment_detail['id']}}"
                                                  data-toggle="tooltip"
                                                  data-placement="{{ floor == 1 ? 'bottom' : 'top' }}"
                                                  title="{{ apartment_detail['name']}}"
                                                  class="status_{{ apartment_detail['condition'] }} aparment {{ getApartmentConditionClass[apartment_detail['condition']] }}">
                                                  {{ apartmentName }}
                                            </span>
                                        </a>
                                    </div>
                                    {% set check = true %}
                                    {% break %}
                                {% endif %}
                                {% else %}
                            {% endfor %}
                        {% endif %}
                    {% endfor %}
                    <div class="clearfix"></div>
                </div>
            {% endfor %}
        </div>
    </div>
</div>