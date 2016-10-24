{% extends 'default_home.volt' %}

{% block title %}{{ blocks['name_eng'] }} - {{ blocks['project_name_eng']}}{% endblock %}
{% block description %}{{ blocks['name_eng'] }} - {{ blocks['project_name_eng']}}{% endblock %}
{% block keywords %}{{ blocks['name_eng'] }} - {{ blocks['project_name_eng']}}{% endblock %}

{% block top_js %}
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.maphilight.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}jquery.flexslider-min.js?{{ config.asset.version }}"></script>
    <script type="text/javascript" src="{{ config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' }}block-building.js?{{ config.asset.version }}"></script>
{%  endblock %}

{% block top_meta %}
    <link rel="canonical" href="{{ url({'for': 'block_detail', 'slug': blocks['slug'], 'id': blocks['id']}) }}" />
{% endblock %}

{% block content %}
    {% set getTrend = getTrend() %}
    {% set getApartmentConditionClass = getApartmentConditionClass() %}
    {% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
    <div class="block-search search-home">
        <div class="container">
            {{ searchBlock }}
        </div>
    </div>

    {% include "default_eng/element/breadcrumbs.volt" %}
    <div class="container">
        <h2 class="title-block title-page">
            {{ blocks['name_eng'] }}
            <div class="dropdown custom-select filter-inline menu" id="load_block">
                <input type="hidden" name="location" value="" />
                <button type="button" id="location" data-toggle="dropdown" data-id="{{ blocks['project_id']  }}" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="arrow"></span></button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                </ul>
            </div>
        </h2>
        <div class="block-view-map">
            <div class="header">
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '1'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Image View_20px.png">
                    </span>
                    <b>Image View</b>
                </a>
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '2'}) }) }}" class="line-icon pull-left">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_Plan View_20px.png">
                    </span>
                    <b>Plan view</b>
                </a>
                <a href="{{ url({ 'for' : 'block_detail', 'slug' : blocks['slug'], 'id' : blocks['id'], 'query' : '?' ~ http_build_query({'type_view': '3'}) }) }}" class="line-icon pull-left active">
                    <span class="icon">
                        <img src="{{ config.asset.frontend_url }}ic-view-method/ic_building map_red_20px-03.png">
                    </span>
                    <b>Building map</b>
                </a>

                <div class="block-status">
                    <div class="entry">
                        <span class="item Available">Available</span>
                        <span class="item Processing">Processing</span>
                        <span class="item Sold">Sold</span>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="text-center secction-building">
                <div class="wrap-inner">
                    <div class="body-building">
                        <div class="building-content">
                            {% set apartment_name_list = blocks['apartment_name_list']|json_decode(true) %}
                            {% set floor_name_list = blocks['floor_name_list']|json_decode(true) %}
                            <table>
                                {% for floor in 1..blocks['floor_count'] %}
                                    <tr>
                                        <th>
                                            <span>
                                                {{ floor_name_list[floor] is defined and floor_name_list[floor] ? floor_name_list[floor] : 'Floor ' ~ floor }}
                                            </span>
                                        </th>

                                        {% for apartment in 1..blocks['apartment_count']%}
                                        {% set indexApartment = loop.index %}
                                        {% set apartmentName = apartment_name_list[indexApartment] is defined and apartment_name_list[indexApartment] is not empty ?  apartment_name_list[indexApartment]  : indexApartment %}

                                            <td>
                                                {% if blocks['apartment'][floor] is defined and blocks['apartment'][floor]|length %}

                                                    {% set check = false %}
                                                    {% for apartment_detail in blocks['apartment'][floor] %}
                                                        {% if (apartment_detail['ordering'] == apartment) %}
                                                            <a href="{{ url({'for': 'apartment_detail', 'slug': apartment_detail['slug'], 'id': apartment_detail['id']}) }}">
                                                                <span data-id="{{apartment_detail['id']}}"
                                                                      data-toggle="tooltip"
                                                                      data-placement="{{ floor == 1 ? 'bottom' : 'top' }}"
                                                                      title="{{ apartment_detail['name']}}"
                                                                      class="status_{{ apartment_detail['condition'] }} aparment {{ getApartmentConditionClass[apartment_detail['condition']] }}">
                                                                      {{ apartmentName }}
                                                                </span>
                                                            </a>
                                                            {% set check = true %}
                                                            {% break %}
                                                        {% endif %}
                                                    {% endfor %}

                                                    {{ check == false ? '<span style="border: 1px solid #F1F1F1; background: #fff; color: #000;">' ~ apartmentName ~ '</span>' : '' }}

                                                {% else %}
                                                    <span style="border: 1px solid #F1F1F1; background: #fff; color: #000;">
                                                        {{ apartmentName }}
                                                    </span>
                                                {% endif %}
                                            </td>
                                        {% endfor %}
                                    </tr>
                                {% endfor %}
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bar">
                <div class="text-center entry">
                    <span class="item Available">Available</span>
                    <span class="item Processing">Processing</span>
                    <span class="item Sold">Sold</span>
                </div>
            </div>
        </div>


        {% include 'default_eng/block/_detail_block.volt' %}
        {% include 'default_eng/block/_other_block.volt' %}
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $('span.aparment').on('click', function(e){
            e.preventDefault();
            var id = $(this).data('id');
            $('.block-view-map').find('.block-info-popup').remove();
            $.ajax({
                url: '{{ url({'for': 'apartment_quick_view'}) }}',
                data: {id: id},
                success: function(data){
                    $('.block-view-map').append(data);
                    $('.block-view-map').find('.block-info-popup').fadeIn('fast');
                    $('.slider-popup').flexslider({
                        animation: "slide",
                        animationLoop: false,
                        itemWidth: 111.333,
                        itemMargin: 0,
                        minItems: 3,
                        maxItems: 3,
                        controlNav: false
                    });
                }

            })
        })

    })
    </script>
{% endblock %}
