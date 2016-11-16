{% set price_search = getPriceSearch() %}
{% set children_search = getChildrenSearch() %}
{% set adult_search = getAdultSearch() %}
{% set type_search = getTypeSearch() %}
<div class="box-widget n-m">
    <h3 class="title-widget">Search Details</h3>
    <div class="content-widget">
        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="undefined" name="type" value='{{ type }}'/>
                <button type="button" id="type-project" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">{{ type_search[type] }}</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key,item in type_search %}               
                        {% set _class = "" %}
                        {% if type == key %}
                            {% set _class = "active" %}
                        {% endif %}
                        <li class='{{ _class }}'>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="group-form">
            <div class="dropdown custom-select"  value='5'>
                <input type="hidden" id="location1" name="location"/>
                <button type="button" id="location" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Địa điểm</span><span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">  
                    <li>
                        <a href="" data-value="0">Any</a></li>
                    {% for key, item in list_by_province %}
                        {% if item|length == 1 %}
                            {% set _class = "" %}
                            {% if location == 'p-' ~item[0]['id'] %}
                                {% set _class = "selected" %}
                                <script>
                                    document.getElementById('location').innerHTML = '<span class="text">{{ item[0]['province_name'] }} - {{ item[0]['name'] }}</span><span class="arrow"></span>';
                                    document.getElementById('location1').value = '{{ location }}';
                                </script>
                            {% endif %}
                            <li class='{{ _class }}'>
                                <a href="" data-value="p-{{ item[0]['id'] }}">
                                    {{ item[0]['province_name'] ~ ' - ' ~ item[0]['name'] }}
                                </a>
                            </li>
                        {% else %}
                            {% set _class = "" %}
                            
                            {% if location == item[0]['province_id'] %}
                                {% set _class = "selected" %}
                                <script>
                                    document.getElementById('location').innerHTML = '<span class="text">{{ item[0]['province_name'] }}</span><span class="arrow"></span>';
                                    document.getElementById('location1').value = '{{ location }}';
                                </script>
                  
                            {% endif %}
                            <li class="has-sub {{ _class }}">
                                <a href="" data-value="{{ item[0]['province_id'] }}">
                                    {{ item[0]['province_name'] }}
                                </a>
                                <ul class="sub-select">
                                    {% for sub_item in item %}
                                        {% set _class1 = "" %}
                                       {% if location == 'p-' ~ sub_item['id'] %}
                                            {% set _class1 = "selected" %}
                                            <script>
                                                document.getElementById('location').innerHTML = '<span class="text">{{ key ~ ' - ' ~ sub_item['name'] }}</span><span class="arrow"></span>';
                                                document.getElementById('location1').value = '{{ location }}';
                                            </script> 
                                        {% endif %}
                                    <li class='{{ _class1 }}'>
                                        <a href="" data-value="p-{{ sub_item['id'] }}">{{ key ~ ' - ' ~ sub_item['name'] }}</a>
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
                <input type="hidden" id="adult_search" name="adults" value='1'/>
                <button type="button" id="adults" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Người lớn</span><span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key,item in adult_search %}
                        {% set _class = "" %}
                        {% if adults == key %}
                             {% set _class = "selected" %}
                             <script>
                                 document.getElementById('adults').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('adult_search').value = '{{ adults }}';
                             </script> 
                        {% endif %}
                        <li class='{{ _class }}'>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="children_search" name="children"  value='1'/>
                <button type="button" id="children" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Trẻ em</span><span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key,item in children_search %}
                        {% set _class = "" %}
                        {% if children == key %}
                             {% set _class = "selected" %}
                             <script>
                                 document.getElementById('children').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('children_search').value = '{{ children }}';
                             </script> 
                        {% endif %}
                        <li class='{{ _class }}'>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
        <div class="group-form">
            <div class="dropdown custom-select">
                <input type="hidden" id="price_search" name="price"  value='1'/>
                <button type="button" id="price" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Giá</span><span class="arrow"></span></button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key,item in price_search %}
                        {% set _class = "" %}
                        {% if price == key %}
                             {% set _class = "selected" %}
                             <script>
                                 document.getElementById('price').innerHTML = '<span class="text">{{ item }}</span><span class="arrow"></span>';
                                 document.getElementById('price_search').value = '{{ price }}';
                             </script> 
                        {% endif %}
                        <li class='{{ _class }}'>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="text-center group-form m-t-15">
            <button class="btn esta-button">Search</button>
        </div>
    </div>
</div>