<?php
$parameter = array();

$parameter = array(
    'application' => array(
        'protocol' => 'http://',
        'base_url' => 'http://jinn.codex4u.com/',
        'api_url' => 'http://apijinn.codex4u.com/',
        'token' => '89d5c70f11e35817110eeeb7863e3ef0',
        'secret' => '88458287415cd6ca24b41bcbe7716e91',
        'cookie_key' => 'demo_home',
        'pagination_limit' => 15,
        'project_pagination_limit' => 10,
        'minhhung_link' => 'http://minhhungland.vn/'
    ),
    'facebook' => array(
        'app_id' => '683690588401570',
        'app_secret' => '56ae354c4491b5263ba659293da16aa5',
        'permission' => array('public_profile')
    ),
    'volt' => array(
        'debug' => true,
        'stat' => true,
        'compiled_separator' => '%'
    ),
    'mailer' => array(
        'delivery' => true,
        'ssl' => true,
        'host' => 'smtp.gmail.com',
        'port' => '465',
        //'username' => 'vinadesign.mailer@gmail.com',
        'username' => 'noreplyjinn.codex4u.com@gmail.com',
        //'password' => '!@#123!@#'
        'password' => 'nhanphong88'
    ),
    'cdn' => array(
        'upload_image_url' => 'http://cdnjinn.codex4u.com/image/upload',
        'delete_image_url' => 'http://cdnjinn.codex4u.com/image/delete',
        'dir_upload' => 'http://cdnjinn.codex4u.com/asset/frontend/upload/stories/'
    ),
    'asset' => array(
        'version' => '20160421_0146',
        'frontend_url' => 'http://cdnjinn.codex4u.com/asset/frontend/',
        'backend_url' => 'http://cdnjinn.codex4u.com/asset/backend/',
        'img_default' => 'http://cdnjinn.codex4u.com/asset/frontend/img/noimage.jpg'
    ),
    'cache' => array(
        'lifetime' => 300,
        'prefix' => '_jinn_home_',
        'type' => 'apc',
        'memcache' => array(
            'host' => '127.0.0.1',
            'port' => 11211,
            'persistent' => false
        ),
        'redis' => array(
            'host' => '127.0.0.1',
            'port' => 6379,
            'auth' => 'redis',
            'persistent' => false
        ),
        'metadata' => array(
            'prefix' => 'jinn_',
            'lifetime' => 31536000
        )
    )
);
