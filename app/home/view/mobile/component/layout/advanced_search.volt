{% set childrenSearch = getChildrenSearch() %}
{% set adultSearch = getAdultSearch() %}
{% set typeSearch = getTypeSearch() %}
{% set minRoomSearch = getMinRoomSearch() %}
{% set maxRoomSearch = getMaxRoomSearch() %}

<div class="box-widget n-m">
    <div class="content-widget filter-advanced">

        <div class="group-form">
            <select name="type" class="custom">
                {% for key, item in typeSearch %}
                    <option {{ request.getQuery('type') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
                {% endfor %}
            </select>
        </div>

        <div class="group-form">
        <select name="location" class="custom">
            {% for key, item in list_by_province %}
                {% if item|length == 1 %}
                    <option value="p-{{ item[0]['id'] }}">{{ item[0]['province_name'] ~ ' - ' ~ item[0]['name'] }}</option>
                {% else %}
                    <opgroup label="{{ item[0]['province_name'] }}">
                        {% for sub_item in item %}
                            <option value="p-{{ sub_item['id'] }}">{{ key ~ ' - ' ~ sub_item['name'] }}</option>
                        {% endfor %}
                    </opgroup>
                {% endif %}
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="adults" class="custom">
            {% for key, item in adultSearch %}
                <option {{ request.getQuery('adults') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="children" class="custom">
            {% for key, item in childrenSearch %}
                <option {{ request.getQuery('children') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="price_min" class="custom">
            {% for key, item in prices['min_price'] %}
                <option {{ request.getQuery('price_min') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="price_max" class="custom">
            {% for key, item in prices['max_price'] %}
                <option {{ request.getQuery('price_max') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="room_search_min" class="custom">
            {% for key, item in minRoomSearch %}
                <option {{ request.getQuery('room_search_min') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

        <div class="group-form">
        <select name="room_search_max" class="custom">
            {% for key, item in maxRoomSearch %}
                <option {{ request.getQuery('room_search_max') == key ? 'selected' : '' }} value="{{ key }}">{{ item }}</option>
            {% endfor %}
        </select>
        </div>

    </div>
</div>
