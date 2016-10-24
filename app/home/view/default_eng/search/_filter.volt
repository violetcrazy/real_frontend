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
    <h3 class="title-widget no-border">Filter</h3>

    <div class="content-widget">
        {% if smartSearch|length %}
            <div class="title-filter">
                Smart search <span class="arrow"></span>
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
            Kiểu Apartment <span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            <ul class="list-unstyled">
                <li class="">
                    {{ customTypeCheckbox('can-ho', 'Apartment', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('thong-tang', 'Duplex', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('penthouse', 'Penthouse', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('studio', 'Studio', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('biet-thu', 'Villa', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('biet-thu-bien', 'Sea villa', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-mat-bien', 'State sea', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-biet-lap', 'Detached house', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('nha-lien-ke', 'Townhouse', attType) }}
                </li>
                <li>
                    {{ customTypeCheckbox('officetel', 'Officetel', attType) }}
                </li>

                <li class="parent">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">Apartment Smart</span>
                    </div>
                    <ul class="secondary-list list-unstyled">
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_1bedroom" />
                                <span class="mark"></span>
                                <span class="text">Control system power savings</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('rem-cua-tu-dong', 'Automatic curtains', attEnergy) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('dieu-khien-tu-dong-den', 'Automatic light control', attEnergy) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnergyControlCheckbox('lo-suoi-hai-chieu', 'Two-way fireplace', attEnergy) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_2bedroom" />
                                <span class="mark"></span>
                                <span class="text">Musical entertainment system</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEntertainingControlCheckbox('dieu-khien-tv', 'Remote TV', attEntertaining) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEntertainingControlCheckbox('dieu-khien-loa', 'Speaker Drivers', attEntertaining) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_3bedroom" />
                                <span class="mark"></span>
                                <span class="text">Environmental control system</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('he-thong-tuoi-nuoc-san-vuon', 'Garden watering systems', attEnvironment) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('he-thong-den-chieu-sang', 'Lighting system', attEnvironment) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customEnvironmentControlCheckbox('dieu-khien-nhiet-do', 'Temperature control', attEnvironment) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label class="custom-checkbox">
                                <input type="checkbox" id="_4bedroom" />
                                <span class="mark"></span>
                                <span class="text">Security system</span>
                                <span class="ic-close"></span>
                            </label>
                            <ul class="sub-list list-unstyled">
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('camera-an-ninh-tu-dong', 'Automatic security cameras', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('he-thong-bao-ro-ri-khi-gas', 'Gas leak alarm systems Gas', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('cam-bien-nhiet', 'Thermal sensor', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('cam-bien-khoi', 'Smoke sensor', attSecurity) }}
                                    </label>
                                </li>
                                <li>
                                    <label class="custom-checkbox">
                                        {{ customSecurityControlCheckbox('thiet-bi-bao-chay-no', 'Fire alarms', attSecurity) }}
                                    </label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="title-filter">
            Property Position<span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            <ul class="list-unstyled">
                <li class="parent">
                    <div class="entry-item">
                        <span class="icon"></span>
                        <span class="text">View</span>
                    </div>
                    <ul class="sub-list list-unstyled">
                        <li>
                            {{ customViewCheckbox('bien', 'Sea', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('song', 'Wave', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('ho', 'Lake', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('ho-boi', 'Pool', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('cong-vien', 'Park', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('san-vuon', 'Sân vườn', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('san-golf', 'Garden', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('thanh-pho', 'City ', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('mat-troi-moc', 'Sunrise ', attView) }}
                        </li>
                        <li>
                            {{ customViewCheckbox('mat-troi-lan', 'Sunset ', attView) }}
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
                        <span class="text">Trend</span>
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
            Property Utilities <span class="arrow"></span>
        </div>
        <div class="entry-filter filter-multiple">
            {{ customUtilityCheckbox('spa', 'Spa', attUtility) }}
            {{ customUtilityCheckbox('gym', 'Gym', attUtility) }}
            {{ customUtilityCheckbox('ho-boi', 'Pool', attUtility) }}
            {{ customUtilityCheckbox('cong-vien', 'Park', attUtility) }}
            {{ customUtilityCheckbox('cong-vien-nuoc', 'Water Park', attUtility) }}
            {{ customUtilityCheckbox('san-choi', 'Playground', attUtility) }}
            {{ customUtilityCheckbox('cong-vien-giai-tri', 'Park', attUtility) }}
            {{ customUtilityCheckbox('nha-hang', 'Restaurant', attUtility) }}
            {{ customUtilityCheckbox('sieu-thi', 'supermarket', attUtility) }}
            {{ customUtilityCheckbox('trung-tam-mua-sam', 'Mall', attUtility) }}
            {{ customUtilityCheckbox('san-golf', 'Golf', attUtility) }}
            {{ customUtilityCheckbox('san-tennis', 'Tennis', attUtility) }}
            {{ customUtilityCheckbox('duong-di-bo', 'Sidewalk', attUtility) }}
            {{ customUtilityCheckbox('dich-vu-don-phong', 'Housekeeping', attUtility) }}
            {{ customUtilityCheckbox('dich-vu-bao-tri', 'Maintenance service', attUtility) }}
            {{ customUtilityCheckbox('bbq', 'BBQ', attUtility) }}
            {{ customUtilityCheckbox('nha-khong-co-noi-that', 'House no furniture', attUtility) }}
            {{ customUtilityCheckbox('nha-co-san-noi-that-co-ban', 'The available interior basic', attUtility) }}
            {{ customUtilityCheckbox('nha-day-du-noi-that', 'Full house furniture', attUtility) }}
        </div>
    </div>
</div>
