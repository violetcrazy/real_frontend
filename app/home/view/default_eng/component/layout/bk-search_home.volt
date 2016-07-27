{% set childrenSearch = getChildrenSearch() %}
{% set adultSearch = getAdultSearch() %}
{% set typeSearch = getTypeSearch() %}

<form action="{{ url({ 'for' : 'search' }) }}" type="get" enctype="multipart/form-data" class="form-search">
    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" id="undefined" name="type" value="" />
            <button type="button" id="type-project" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Tất cả</span><span class="arrow"></span></button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                {% for key, item in typeSearch %}
                    <li>
                        <a href="" data-value="{{ key }}">{{ item }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>

    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" id="undefined" name="location" value="" />
            <button type="button" id="location" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Địa điểm</span><span class="arrow"></span></button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                <li>
                    <a href="" data-value="">Tất cả</a>
                </li>
                {% for key, item in list_by_province %}
                    {% if item|length == 1 %}
                        <li>
                            <a href="" data-value="p-{{ item[0]['id'] }}">
                                {{ item[0]['province_name'] ~ ' - ' ~ item[0]['name'] }}
                            </a>
                        </li>
                    {% else %}
                        <li class="has-sub">
                            <a href="" data-value="{{ item[0]['province_id'] }}">
                                {{ item[0]['province_name'] }}
                            </a>
                            <ul class="sub-select">
                                {% for sub_item in item %}
                                <li>
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

    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" id="undefined" name="adults" value="" />
            <button type="button" id="adults" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                <span class="text">Người lớn</span><span class="arrow"></span>
            </button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                {% for key, item in adultSearch %}
                    <li>
                        <a href="" data-value="{{ key }}">{{ item }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>

    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" id="undefined" name="children" value="" />
            <button type="button" id="children" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                <span class="text">Trẻ em</span><span class="arrow"></span>
            </button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                {% for key, item in childrenSearch %}
                    <li>
                        <a href="" data-value="{{ key }}">{{ item }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>

    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" id="undefined" name="price" value="" />
            <button type="button" id="price" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Giá</span><span class="arrow"></span></button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                {% for key, item in prices %}
                    <li>
                        <a href="" data-value="{{ key }}">{{ item }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    <div class="item action-submit">
        <button type="submit" class="esta-button">Tìm</button>
    </div>
    <div class="clearfix"></div>
</form>