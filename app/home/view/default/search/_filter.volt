{%- macro customTypeCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_type[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_type[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_type[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customViewCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_view[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_view[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_view[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customUtilityCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_utility[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_utility[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_utility[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customTrendCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_trend[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_trend[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_trend[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customEnergyControlCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_energy[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_energy[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_energy[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customEntertainingControlCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_entertaining[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_entertaining[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_entertaining[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customEnvironmentControlCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_environment[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_environment[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_environment[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customSecurityControlCheckbox(id, text, attributes) %}
    {% set hasInput = false %}

    <label class="custom-checkbox">
        {% if attributes is defined and attributes|length %}
            {% for item in attributes %}
                {% if item == id %}
                    <input type="checkbox" checked="checked" id="{{ id }}" name="att_security[]" value="{{ id }}" />
                    {% set hasInput = true %}
                {% endif %}
            {% endfor %}
        {% else %}
            <input type="checkbox" id="{{ id }}" name="att_security[]" value="{{ id }}" />
            {% set hasInput = true %}
        {% endif %}

        {% if hasInput == false %}
            <input type="checkbox" id="{{ id }}" name="att_security[]" value="{{ id }}" />
        {% endif %}

        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{% set trends = getTrend() %}

<div class="box-widget module-search">
    <h3 class="title-widget no-border">Bộ lọc</h3>

    <div class="content-widget">
        {% if smartSearch|length %}
            <div class="title-filter">
                Tìm kiếm thông minh <span class="arrow"></span>
            </div>
            <div class="entry-filter filter-multiple">
                <ul class="list-unstyled smartsearch">
                    {% for item in smartSearch %}
                        {% if item['id'] == cid %}
                            <li class="active">
                                <label class="custom-checkbox" for="smart_search_{{ item['id'] }}">
                                    <input data-value='{{ item['search_query_json'] }}' type="radio" name="smart_search" id="smart_search_{{ item['id'] }}" checked="checked" />
                                    <span class="mark"></span>
                                    <span class="text">{{ item['name'] }}</span>
                                </label>
                            </li>
                        {% else %}
                            <li class="">
                                <label class="custom-checkbox" for="smart_search_{{ item['id'] }}">
                                    <input data-value='{{ item['search_query_json'] }}' type="radio" name="smart_search" id="smart_search_{{ item['id'] }}" />
                                    <span class="mark"></span>
                                    <span class="text">{{ item['name'] }}</span>
                                </label>
                            </li>
                        {% endif %}
                    {% endfor %}
                </ul>
            </div>
        {% endif %}

        <div class="title-filter">
            Kiểu căn hộ <span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            <ul class="list-unstyled">
                <li class="">
                    {{ customTypeCheckbox('can-ho', 'Căn hộ', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('thong-tang', 'Thông tầng', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('penthouse', 'Penthouse', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('studio', 'Studio', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('biet-thu', 'Biệt thự', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('biet-thu-bien', 'Biệt thự biển', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-mat-bien', 'Nhà mặt biển', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-biet-lap', 'Nhà biệt lập', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-lien-ke', 'Nhà liền kề', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('officetel', 'Officetel', attType) }}
                </li>

                <li class="parent">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">Căn hộ thông minh</span>
                    </div>
                    <ul class="secondary-list list-unstyled">
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_1bedroom" />
                                <span class="mark"></span>
                                <span class="text">Hệ thống điều khiển tiết kiệm điện</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('rem-cua-tu-dong', 'Rèm cửa tự động', attEnergy) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('dieu-khien-tu-dong-den', 'Điều khiển tự động đèn', attEnergy) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('lo-suoi-hai-chieu', 'Lò sưởi hai chiều', attEnergy) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_2bedroom" />
                                <span class="mark"></span>
                                <span class="text">Hệ thống giải trí âm nhạc</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEntertainingControlCheckbox('dieu-khien-tv', 'Điều khiển TV', attEntertaining) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEntertainingControlCheckbox('dieu-khien-loa', 'Điều khiển loa', attEntertaining) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_3bedroom" />
                                <span class="mark"></span>
                                <span class="text">Hệ thống kiểm soát môi trường</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('he-thong-tuoi-nuoc-san-vuon', 'Hệ thống tưới nước sân vườn', attEnvironment) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('he-thong-den-chieu-sang', 'Hệ thống đèn chiếu sáng', attEnvironment) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('dieu-khien-nhiet-do', 'Điều khiển nhiệt độ', attEnvironment) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_4bedroom" />
                                <span class="mark"></span>
                                <span class="text">Hệ thống an ninh</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('camera-an-ninh-tu-dong', 'Camera an ninh tự động', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('he-thong-bao-ro-ri-khi-gas', 'Hệ thống báo rò rỉ khí Gas', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('cam-bien-nhiet', 'Cảm biến nhiệt', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('cam-bien-khoi', 'Cảm biến khói', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('thiet-bi-bao-chay-no', 'Thiết bị báo cháy nổ', attSecurity) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="title-filter">
            Vị trí <span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            <ul class="list-unstyled">
                <li class="parent">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">Hướng nhìn</span>
                    </div>
                    <ul class="sub-list list-unstyled">
                        <li>
                            {{ customViewCheckbox('bien', 'Biển', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('song', 'Sông', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('ho', 'Hồ', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('ho-boi', 'Hồ bơi', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('cong-vien', 'Công viên', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('san-vuon', 'Sân vườn', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('san-golf', 'Sân golf', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('thanh-pho', 'Thành phố', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('mat-troi-moc', 'Mặt trời mọc', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('mat-troi-lan', 'Mặt trời lặn', attView) }}
                        </li>
                    </ul>
                </li>

                {#
                <li class="parent active">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">Phong thủy</span>
                    </div>
                    <ul class="sub-list list-unstyled">
                        <li>
                            <div class="select-field">
                                <div class="dropdown custom-select">
                                    <input type="hidden" id="undefined" name="1990"/>
                                    <button type="button" id="1990" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">1990</span><span class="arrow"></span></button>
                                    <ul aria-labelledby="type-project" class="dropdown-menu">
                                        <li><a href="" data-value="1992">1992</a></li>
                                        <li><a href="" data-value="1995">1995</a></li>
                                        <li><a href="" data-value="2000">2000</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="select-field">
                                <div class="dropdown custom-select">
                                    <input type="hidden" id="undefined" name="gender"/>
                                    <button type="button" id="gender" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle"><span class="text">Giới tính </span><span class="arrow"></span></button>
                                    <ul aria-labelledby="type-project" class="dropdown-menu">
                                        <li><a href="" data-value="1">Nam</a></li>
                                        <li><a href="" data-value="2">Nữ</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                #}

                <li class="parent">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">Hướng</span>
                    </div>
                    <ul class="sub-list list-unstyled">
                        {% for key, value in trends %}
                            <li>
                                {{ customTrendCheckbox(key, value, attTrend) }}
                            </li>
                        {% endfor %}
                    </ul>
                </li>
            </ul>
        </div>

        <div class="title-filter">
            Tiện ích <span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            {{ customUtilityCheckbox('spa', 'Spa', attUtility) }}
            {{ customUtilityCheckbox('gym', 'Gym', attUtility) }}
            {{ customUtilityCheckbox('ho-boi', 'Hồ bơi', attUtility) }}
            {{ customUtilityCheckbox('cong-vien', 'Công viên', attUtility) }}
            {{ customUtilityCheckbox('cong-vien-nuoc', 'Công viên nước', attUtility) }}
            {{ customUtilityCheckbox('san-choi', 'Sân chơi', attUtility) }}
            {{ customUtilityCheckbox('cong-vien-giai-tri', 'Công viên giải trí', attUtility) }}
            {{ customUtilityCheckbox('nha-hang', 'Nhà hàng', attUtility) }}
            {{ customUtilityCheckbox('sieu-thi', 'Siêu thị', attUtility) }}
            {{ customUtilityCheckbox('trung-tam-mua-sam', 'Trung tâm mua sắm', attUtility) }}
            {{ customUtilityCheckbox('san-golf', 'Sân golf', attUtility) }}
            {{ customUtilityCheckbox('san-tennis', 'Sân tennis', attUtility) }}
            {{ customUtilityCheckbox('duong-di-bo', 'Đường đi bộ', attUtility) }}
            {{ customUtilityCheckbox('dich-vu-don-phong', 'Dịch vụ dọn phòng', attUtility) }}
            {{ customUtilityCheckbox('dich-vu-bao-tri', 'Dịch vụ bảo trì', attUtility) }}
            {{ customUtilityCheckbox('bbq', 'BBQ', attUtility) }}
            {{ customUtilityCheckbox('nha-khong-co-noi-that', 'Nhà không có nội thất', attUtility) }}
            {{ customUtilityCheckbox('nha-co-san-noi-that-co-ban', 'Nhà có sẵn nội thất cơ bản', attUtility) }}
            {{ customUtilityCheckbox('nha-day-du-noi-that', 'Nhà đầy đủ nội thất', attUtility) }}
        </div>
    </div>
</div>
