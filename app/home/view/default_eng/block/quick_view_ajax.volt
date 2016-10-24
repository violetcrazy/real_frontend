{% set getTrend = getTrend() %}
<div class="popup-map">
    <h3 class="title">{{ block_detail['project_name_eng'] }} > {{ block_detail['name_eng'] }}<span class="close"></span></h3>
    <div class="entry">
        <div class="row border">
            <div class="col-left">
                <div class="line-icon">
                    <span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png" alt=""/></span>
                    <b>Floor</b>: {{ block_detail['floor_count'] }}
                </div>
            </div>
            <div class="col-right">
                <div class="line-icon">
                    <span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-orientation-black.png" alt=""/></span>
                    <b>{{ getTrend[block_detail['property_trend']] }}</b>
                </div>
            </div>
        </div>
        <div class="row border">
            <div class="col-left">
                <div class="line-icon">
                    <span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-floor-black.png" alt=""/></span>
                    <b>Apartments</b>: {{ currencyFormat(block_detail['apartment_all_count']) }}
                </div>
            </div>
            <div class="col-right">
                <div class="line-icon group-text">
                    <span class="icon"></span>
                    <b>Available: {{ block_detail['apartment_available_count'] }} <br /></b>
                    <b>Processing: {{ block_detail['apartment_processing_count'] }} <br /></b>
                    <b>Sold: {{ block_detail['apartment_sold_count'] }}</b>
                </div>
            </div>
        </div>
        <div class="row border view">
            <div class="col-left">
                <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-view-black.png" alt=""/></span><b>Views:</b></div>
            </div>
            <div class="col-right">
                <div class="group-line-icon">
                    {% for item in block_detail['property_view_eng'] %}
                        <div class="line-icon">
                            <span class="icon">
                                <img src="{{ item['image_two_url'] }}">
                            </span>
                            {{ item['name'] }}
                        </div>
                    {% endfor %}
                </div>
            </div>
        </div>
        <div class="row border">
            <div class="col-left">
                <div class="line-icon"><span class="icon"><img src="{{ config.asset.frontend_url }}desktop/version-1.0/template/html_project/asset/img/icon/ic-dola.png" width="10px" alt=""/></span><b>Price:</b></div>
            </div>
            <div class="col-right">
                <div class="line-icon group-text">
                    {{ block_detail['price_eng'] }}
                </div>
            </div>
        </div>
        <div class="link-botom">
            <a href="{{ url({ 'for': 'block_detail', 'slug': block_detail['slug'] , 'id': block_detail['id'] }) }}" class="link">
                Readmore
            </a>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $('img').each(function(){
        $(this).on('error', function(){
            var wP = $(this).parent().width();
            var src = '';
            $(this).attr('data-wp', wP);
            if(wP == 0 || wP < 0) {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage.jpg';
            } else if(wP < 51) {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage50.jpg';
            } else if (wP < 101){
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage100.jpg';
            } else if (wP == 501){
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage500.jpg';
            } else {
                src = 'http://cdn.jinn.vn/asset/frontend/img/noimage.jpg';
            }
            $(this).attr('src', src);
        })
    });
});
</script>
