
<div class="block-detail">
    <div class="overview">
        <div class="tab-custom">
            <div class="tr">
                <div class="th">
                    <span class="icon-new icon-over"></span> Tổng quan</div>
                <div class="td">
                    <div class="p m-b-20">
                        <span class="fw-500">Dự án:</span> {{ blocks['name'] }} - {{ blocks['province']['name'] }}
                    </div>
                    <div class=" p m-b-20">
                        <span class="fw-500">Số tầng:</span> {{ blocks['floor_count'] }}
                    </div>

                    <div class="row m-b-5">
                        <div class="col-xs-3">
                            <div class=" p">
                                <span class="fw-500">Căn hộ: </span> {{ currencyFormat(blocks['apartment_count']) }}
                            </div>
                        </div>

                        <div class="col-xs-3">
                            <div class=" p">
                                <span class="icon"></span>
                                <span class="fw-500">Còn trống: </span> {{ currencyFormat(blocks['apartment_available_count']) }}
                            </div>
                        </div>

                        <div class="col-xs-3">
                            <div class=" p">
                                <span class="icon"></span>
                                <span class="fw-500">Đang xử lý: </span> {{ currencyFormat(blocks['apartment_processing_count']) }}
                            </div>
                        </div>

                        <div class="col-xs-3">
                            <div class=" p">
                                <span class="icon"></span>
                                <span class="fw-500">Đã bán: </span> {{ currencyFormat(blocks['apartment_sold_count']) }}
                            </div>
                        </div>
                    </div>

                    <div class="description">
                        <div class="short">
                            {{ niceWordsByChars(blocks['description'], 200) }}
                        </div>
                        <div class="long">
                            {{ blocks['description'] }}
                        </div>

                        {% if blocks['description']|length > 200 %}
                            <div class="more-link">
                                <a class="link">[+ Xem thêm]</a>
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>

            <div class="tr">
                <div class="th">
                    <span class="icon-new icon-type"></span>
                    Các kiểu căn hộ</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% for item in blocks['attribute']['type'] %}
                            <div class="col-xs-4">
                                <div class="line-icon no-icon p">
                                    {{ item['name'] }}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </div>

            <div class="tr">
                <div class="th">
                    <span class="icon-new icon-env"></span>
                    Môi trường sống</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% if blocks['total_area'] > 0 %}
                            <div class="col-xs-6">
                                <div class="line-icon no-icon p">
                                    Diện tích: {{ currencyFormat(blocks['total_area']) }}m<sup>2</sup>
                                </div>
                            </div>
                        {% endif %}

                        <div class="col-xs-6">
                            <div class="line-icon no-icon p">
                                Hướng nhìn:
                                {% for item in blocks['attribute']['view'] %}
                                    {{ loop.index > 1 ? ',' : '' }} {{ item['name'] }}
                                {% endfor %}
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="line-icon no-icon p">
                                Hướng: {{ blocks['direction_text'] }}
                            </div>
                        </div>

                        {% if blocks['green_area'] > 0 %}
                            <div class="col-xs-6">
                                <div class="line-icon no-icon p">
                                    Diện tích cây xanh: {{ currencyFormat(blocks['green_area']) }}m<sup>2</sup>
                                </div>
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>

            <div class="tr">
                <div class="th">
                    <span class="icon-new icon-util"></span>
                    Dịch vụ -  Tiện ích</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% for item in blocks['attribute']['utility'] %}
                            <div class="col-xs-4">
                                <div class="line-icon no-icon p">
                                    {{ item['name'] }}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#load_block button').click(function(event){
            event.preventDefault();
            $this = $(this);
            var urlBlock = '{{ config.application.base_url }}block';
            var projectId = $this.data('id');
            $.ajax({
                url: '{{ url({'for': 'ajax_center'}) }}',
                data: {
                    action: 'listBlockByProject',
                    project_id: projectId
                },
                type: 'post',
                dataType: 'json',
                success: function(data){
                    if (data.status == 200) {
                        var html = '';
                        $.each(data.result, function(index, value){
                            html += '<li> <a href="'+ urlBlock + '/' + value.slug + '-' + value.id +'" >'+ value.name +'</a></li>'
                        });

                        $this.next('.dropdown-menu').html(html);
                    }
                }
            })
        })
    });
</script>
