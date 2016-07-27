<?php
$router->add('/{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'home',
    'action' => 'index'
))->setName('home');

$router->add('/project', array(
    'module' => 'home',
    'controller' => 'project',
    'action' => 'list'
))->setName('project_list');

$router->add('/project/{slug:[a-z0-9-]+}-{id:[a-z0-9-]+}{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'project',
    'action' => 'detail'
))->setName('project_detail');

$router->add('/block/{slug:[a-z0-9-]+}-{id:[a-z0-9-]+}{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'block',
    'action' => 'detail'
))->setName('block_detail');

$router->add('/block-quick-view-ajax', array(
    'module' => 'home',
    'controller' => 'block',
    'action' => 'quickViewAjax'
))->setName('block_quick_view');

$router->add('/apartment/{slug:[a-z0-9-]+}-{id:[0-9]+}{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'detail'
))->setName('apartment_detail');

$router->add('/apartment/{slug:[a-z0-9-]+}-{id:[0-9]+}/request{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'request'
))->setName('apartment_request');

$router->add('/apartment-quick-view-ajax', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'quickViewAjax'
))->setName('apartment_quick_view');

$router->add('/apartment/contact-furniture-ajax', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'contactFurnitureAjax'
))->setName('apartment_contact_furniture_ajax');

$router->add('/{slug:[a-z0-9-]+}-{id:[0-9-]+}{{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'article',
    'action' => 'list'
))->setName('article_list');

$router->add('/{slug:[a-z0-9-]+}/{id:[0-9-]+}{{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'article',
    'action' => 'detail'
))->setName('article_detail');

$router->add('/news', array(
    'module' => 'home',
    'controller' => 'article',
    'action' => 'listByCategory'
))->setName('article_list_news');

$router->add('/apartment/for-sale', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'buy'
))->setName('apartment_buy');

$router->add('/apartment/for-rent', array(
    'module' => 'home',
    'controller' => 'apartment',
    'action' => 'rent'
))->setName('apartment_rent');

$router->add('/rent', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'rent'
))->setName('static_rent');

$router->add('/user', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'user'
))->setName('static_user');

$router->add('/saved-home', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'savedHome'
))->setName('static_saved_home');

$router->add('/saved-search', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'savedSearch'
))->setName('static_saved_search');

$router->add('/purchased-properties', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'purchasedProperties'
))->setName('static_purchased_properties');

$router->add('/danh-ba{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'contact'
))->setName('user_contact');

$router->add('/them-danh-ba-ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'addContactAjax'
))->setName('user_add_contact_ajax');

$router->add('/xoa-danh-ba-ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'deleteContactAjax'
))->setName('user_delete_contact_ajax');

$router->add('/messages', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'Messages'
))->setName('static_messages');

$router->add('/settings', array(
    'module' => 'home',
    'controller' => 'static',
    'action' => 'settings'
))->setName('static_settings');

//--------- User
$router->add('/thanh-vien/dang-ky', array(
    'module' => 'home',
    'controller' => 'home',
    'action' => 'userRegister'
))->setName('user_register');

$router->add('/dai-ly/dang-ky', array(
    'module' => 'home',
    'controller' => 'home',
    'action' => 'agentRegister'
))->setName('agent_register');

$router->add('/thanh-vien/dang-nhap', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'userLogin'
))->setName('user_login');

$router->add('/dai-li/dang-nhap', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'agentLogin'
))->setName('agent_login');

$router->add('/user-sign-in-ajax', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'userSignInAjax'
))->setName('user_sign_in_ajax');

$router->add('/user-sign-up-ajax', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'userSignUpAjax'
))->setName('user_sign_up_ajax');

$router->add('/user-forgot-password-ajax', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'userForgotPasswordAjax'
))->setName('user_forgot_password_ajax');

$router->add('/forgot-password', array(
    'module' => 'home',
    'controller' => 'home',
    'action' => 'forgotPassword'
))->setName('forgot_password');

$router->add('/logout', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'userLogout'
))->setName('user_logout');

$router->add('/user-info', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'profile'
))->setName('user_profile');

$router->add('/agent-info-{id:[0-9-]+}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'detail'
))->setName('user_detail');

$router->add('/edit-user-info', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'edit'
))->setName('user_edit');

$router->add('/properties', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'purchasedProperties'
))->setName('user_purchased_properties');

$router->add('/properties/{id:[0-9-]+}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'purchasedPropertiesByAgent'
))->setName('user_purchased_properties_by_agent');

$router->add('/save-home', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'saveHome'
))->setName('user_save_home');

$router->add('/save-home/{id:[0-9-]+}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'saveHomeByAgent'
))->setName('user_save_home_by_agent');

$router->add('/save-search', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'saveSearch'
))->setName('user_save_search');

$router->add('/notification{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'message'
))->setName('user_message');

$router->add('/agent-list{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'listAgent'
))->setName('user_list_agent');

$router->add('/save-bookmark', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'saveBookmarkAjax'
))->setName('user_like_aparment_ajax');

$router->add('/delete-bookmark{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'deleteBookmarkAjax'
))->setName('user_unlike_aparment_ajax');

$router->add('/save-search-ajax', array(
    'module' => 'home',
    'controller' => 'user',
    'action' => 'saveSearchAjax'
))->setName('user_save_search_ajax');
// User ------

$router->add('/search{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'search',
    'action' => 'index'
))->setName('search');

$router->add('/make-url-search{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'search',
    'action' => 'createUrlAjax'
))->setName('getLinkSearch');

$router->add('/get-district{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'base',
    'action' => 'getDistrict'
))->setName('get_district');

$router->add('/get-option-district{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'base',
    'action' => 'getOptionDistrict'
))->setName('get_option_district');

//--------- Message
$router->add('/send-message-ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'message',
    'action' => 'send',
))->setName('send_message_ajax');

$router->add('/send-mail-ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'message',
    'action' => 'sendMail',
))->setName('send_mail_ajax');

$router->add('/send-mail-khach-hang{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'message',
    'action' => 'sendMailContactCustomer',
))->setName('send_mail_contact_customer');

$router->add('/message-detail-{id:[0-9-]+}{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'message',
    'action' => 'detail',
))->setName('message_detail');
//Message ------

//--------- Load ajax
$router->add('/load/gallery/ajax', array(
    'module' => 'home',
    'controller' => 'load',
    'action' => 'galleryAjax'
))->setName('load_gallery_ajax');

$router->add('/load/upload-image/ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'load',
    'action' => 'uploadImageAjax'
))->setName('load_upload_image_ajax');

$router->add('/load/upload-image-cdn/ajax{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'load',
    'action' => 'uploadImageCdnAjax'
))->setName('load_upload_image_cdn_ajax');

$router->add('/load/ajax-center{query:(/.*)*}', array(
    'module' => 'home',
    'controller' => 'load',
    'action' => 'ajaxCenter'
))->setName('ajax_center');
//Load ajax ---------

$router->add('/contact', array(
    'module' => 'home',
    'controller' => 'contact',
    'action' => 'index',
))->setName('contact');


$router->setUriSource(\Phalcon\Mvc\Router::URI_SOURCE_SERVER_REQUEST_URI);
$router->notFound(array(
    'module' => 'home',
    'controller' => 'error',
    'action' => 'error404'
));