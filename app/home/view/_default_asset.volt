<link type="image/x-icon" rel="shortcut icon" href="{{ config.asset.frontend_url ~ 'img/favicon.png?' ~ config.asset.version }}" />
<link type="image/x-icon" rel="icon" href="{{ config.asset.frontend_url ~ 'img/favicon.png?' ~ config.asset.version }}" />

{% set css_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/css/' %}
{% set js_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/js/' %}

<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900" />
<link type="text/css" rel="stylesheet" href="{{ config.asset.frontend_url ~ 'plugins/fancybox/jquery.fancybox.css?' ~ config.asset.version }}" />
<link type="text/css" rel="stylesheet" href="{{ css_dir ~ 'style.css?' ~ config.asset.version }}" />

<script type="text/javascript">
    var user_like_aparment_ajax = '{{ url({'for' : 'user_like_aparment_ajax'}) }}';
    var user_unlike_aparment_ajax = '{{ url({'for' : 'user_unlike_aparment_ajax'}) }}';
    var default_image = '{{ config.asset.img_default }}';
</script>

<script type="text/javascript" src="{{ js_dir ~ 'jquery.js?' ~ config.asset.version }}"></script>
<script type="text/javascript" src="{{ js_dir ~ 'bootstrap.js?' ~ config.asset.version }}"></script>
<script type="text/javascript" src="{{ js_dir ~ 'jquery.mCustomScrollbar.concat.min.js?' ~ config.asset.version }}"></script>
<script type="text/javascript" src="{{ config.asset.frontend_url ~ 'plugins/fancybox/jquery.fancybox.pack.js?' ~ config.asset.version }}"></script>
<script type="text/javascript" src="{{ js_dir ~ 'global.js?' ~ config.asset.version }}"></script>


<script type="text/javascript" src="{{ config.application.base_url ~ 'asset/default/home/js/save_bookmark.js?' ~ config.asset.version }}"></script>
