<div class="wrap-list">
    <form class="filter-block block-inner2">
        <select class="esta-select block" id="block-filter">
            {% for item in arrBlocks %}
                <option {{ (item['id'] == blocks['id']) ? 'selected' : '' }} value="{{ url({ 'for' : 'block_detail', 'slug' : item['slug'], 'id' : item['id'] }) }}?type={{ request.getQuery('type') }}"> {{ item['name'] }} </option>
            {% endfor %}
        </select>
        <select class="esta-select block m-t-10"  id="floor_count" name="floor_count">
            {% for key, floor in floor_name_list %}
                <option {{ (key == floor_count) ? 'selected' : '' }} value="{{ key }}"> {{ floor }}</option>
            {% endfor %}
        </select>
    </form>
    <div class="block-inner1">
        <h1 class="title-style1">KẾT QUẢ TÌM KIẾM
            <div class="des-title">Tìm thấy {{ total_items }} kết quả phù hợp.</div>
        </h1>
    </div>
    <div class="list-style3">
        <div class="entry">
            {% if list_apartment_block is not empty %}
                {% for item in list_apartment_block %}
                    {% set apartment = item %}
                    {% include 'mobile/apartment/_item_list.volt' %}
                {% endfor %}
            {% else %}
            {% endif %}
        </div>
        <div class="pagination">
            {{ paginationLayout }}
        </div>
        {#<div class="link-more text-right"><a href="" class="link">See more</a></div>#}
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#block-filter').on('change', function(){
            var vl = $(this).val();
            if (vl != '') {
                window.location.href= vl;
            }
        });

        $('#floor_count').on('change', function(){
            $(this).closest('form').submit();
        });
    })
</script>