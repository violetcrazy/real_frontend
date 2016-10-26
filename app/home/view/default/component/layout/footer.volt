{% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}
<div class="footer-site">
    <div class="container">
        <div class="row address">
            <div class="col-xs-4">
                <div class="entry">
                    {{ options['footer1_vi'] is defined and options['footer1_vi']['value'] is not empty ? options['footer1_vi']['value'] : '' }}
                </div>
            </div>
            <div class="col-xs-4">
                <div class="entry">
                    {{ options['footer2_vi'] is defined and options['footer2_vi']['value'] is not empty ? options['footer2_vi']['value'] : '' }}
                </div>
            </div>
            <div class="col-xs-4">
                <div class="entry phone">
                    {{ options['footer3_vi'] is defined and options['footer3_vi']['value'] is not empty ? options['footer3_vi']['value'] : '' }}
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="text-center">
                <div class="title">folow us</div>
                <div class="social">
                    <a href="{{ options['facebook'] is defined ? options['facebook'] : '' }}" class="facebook"><img src="{{ img_dir }}icon/ic-facebook.png"></a>
                    <a href="{{ options['google_plus'] is defined ? options['google_plus'] : '' }}" class="google"><img src="{{ img_dir }}icon/ic-google.png"></a>
                    <a href="{{ options['twitter'] is defined ? options['twitter'] : '' }}" class="twiter"><img src="{{ img_dir }}icon/ic-twiter.png"></a>
                </div>
                <div class="text-mh text-center">
                    <a href="{{ config.application.minhhung_link }}" target="_blank">
                        <img src="{{ config.asset.frontend_url }}img/logo-white.png" alt="">,
                        Một sản phẩm của <b>Minh Hưng Land</b>
                    </a>
                    <span class="line-bottom"></span>
                </div>
                <div class="copyright">Copyright JINN 2015 All Rights Reserved</div>
            </div>
        </div>
    </div>
</div>
