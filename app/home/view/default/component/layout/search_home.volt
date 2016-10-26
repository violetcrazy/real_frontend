{% set childrenSearch = getChildrenSearch() %}
{% set adultSearch = getAdultSearch() %}
{% set typeSearch = getTypeSearch() %}
{% set minRoomSearch = getMinRoomSearch() %}
{% set maxRoomSearch = getMaxRoomSearch() %}

<form action="{{ url({ 'for' : 'search' }) }}" type="get" enctype="multipart/form-data" class="form-search">
    <!-- <div class="title-search">Tìm kiếm căn hộ</div> -->

    <div class="item buy-select menu-left">
        <div class="dropdown custom-select">
            <input type="hidden" name="type" value="" />
            <button type="button" id="type-project" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                <span class="text">Tất cả</span>
                <span class="arrow"></span>
            </button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                {% for key, item in typeSearch %}
                    <li>
                        <a href="" data-value="{{ key }}">{{ item }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>

    <div class="input-key-search">
        <input type="text" name="q" placeholder="Tìm theo tên dự án, block, căn hộ" />
    </div>

    <div class="item">
        <div class="dropdown custom-select">
            <input type="hidden" name="location" value="" />
            <button type="button" id="location" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Địa điểm</span><span class="arrow"></span></button>
            <ul aria-labelledby="type-project" class="dropdown-menu">
                <li>
                    <a href="" data-value="">Tất cả</a>
                </li>

                {% for key, item in list_by_province %}
                    {% if item|length == 1 %}
                        <li>
                            <a href="" data-value="p-{{ item[0]['id'] }}">
                                {{ item[0]['province']['name'] ~ ' - ' ~ item[0]['name'] }}
                            </a>
                        </li>
                    {% else %}
                        <li class="has-sub">
                            <a href="" data-value="{{ item[0]['province']['id'] }}">
                                {{ item[0]['province']['name'] }}
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

    <div class="clearfix"></div>
    <div class="row2">
        <div class="item menu-left">
            <div class="dropdown custom-select">
                <input type="hidden" name="att_type[]">
                <button type="button" id="filter-type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Loại căn hộ</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li><a href="" data-value="can-ho">Căn hộ</a></li>
                    <li><a href="" data-value="biet-thu">Biệt thự</a></li>
                    <li><a href="" data-value="thong-tang">Thông tầng</a></li>
                </ul>
            </div>
        </div>

        <div class="item">
            <div class="dropdown custom-select">
                <input type="hidden" name="adults" value="" />
                <button type="button" id="adults" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Người lớn</span>
                    <span class="arrow"></span>
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
                <input type="hidden" name="children" value="" />
                <button type="button" id="children" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Trẻ em</span>
                    <span class="arrow"></span>
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
                <input type="hidden" name="bedroom_min">
                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Min Beds</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in minRoomSearch %}
                        <li>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
        <div class="item">
            <div class="dropdown custom-select">
                <input type="hidden" name="bedroom_max">
                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Max Beds</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in maxRoomSearch %}
                        <li>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="item">
            <div class="dropdown custom-select">
                <input type="hidden" name="price_min">
                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Min Price</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in prices['min_price'] %}
                        <li>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>

        <div class="item">
            <div class="dropdown custom-select">
                <input type="hidden" name="price_max">
                <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">Max Price</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    {% for key, item in prices['max_price'] %}
                        <li>
                            <a href="" data-value="{{ key }}">{{ item }}</a>
                        </li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>

    <div class="item action-submit">
        <button type="submit" class="esta-button">Tìm</button>
    </div>
    <div class="clearfix"></div>
</form>
