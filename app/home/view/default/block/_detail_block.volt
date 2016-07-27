<div class="block-detail">
    <div class="overview">
        <div class="tab-custom">
            <div class="tr">
                <div class="th">Tổng quan</div>
                <div class="td">
                    <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-position.png"></span><b>Dự án: {{ blocks['project']['name']}} - {{ blocks['province']['name']}}</b></div>
                    <div class="row layout-4">
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-orientation-black.png"></span><b>{{ blocks['direction_text'] }}</b></div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-ha.png"></span><b>{{ blocks['total_area'] }} ha</b></div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic-tree.png"></span>
                                <b>{{ blocks['green_area'] }} m<sup>2</sup></b>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic_Pen House_20px.png"></span><b>{{ blocks['floor_count'] }} Tầng</b></div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"><img src="{{ config.asset.frontend_url }}icon/ic_Apartment_20px.png"></span>
                                <b>
                                {{ currencyFormat(blocks['apartment_all_count']) }} Căn hộ
                                </b>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"></span><b>Còn trống: {{ currencyFormat(blocks['apartment_available_count']) }}</b></div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"></span><b>Đang xử lý: {{ currencyFormat(blocks['apartment_processing_count']) }}</b></div>
                        </div>
                        <div class="col-xs-3">
                            <div class="line-icon p"><span class="icon"></span><b>Đã bán: {{ currencyFormat(blocks['apartment_sold_count']) }}</b></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="description">
                        <div class="short"> {{ niceWordsByChars(blocks['description'], 200) }}...</div>
                        <div class="long">
                            {{ blocks['description'] }}
                        </div>
                        <div class="more-link"><a class="link">[+ Xem thêm]</a></div>
                    </div>
                </div>
            </div>
            <div class="tr">
                <div class="th">Các kiểu căn hộ</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% for item in blocks['attribute']['type'] %}
                            <div class="col-xs-4">
                                <div class="line-icon p">
                                    {{ item['name'] }}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
            <div class="tr">
                <div class="th">Hướng nhìn</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% for item in blocks['attribute']['view'] %}
                            <div class="col-xs-4">
                                <div class="line-icon p">
                                    {{ item['name'] }}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
            <div class="tr">
                <div class="th">Tiện ích</div>
                <div class="td clear-p">
                    <div class="row layout-3">
                        {% for item in blocks['attribute']['utility'] %}
                            <div class="col-xs-4">
                                <div class="line-icon p">
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
