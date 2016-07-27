<?php
namespace ITECH\Home\Controller;

class ApartmentController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function detailAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);
        $language = $this->session->get('LANGUAGE');
        if (!$language) {
            $language = \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_VIET;
        }

        $id = $this->dispatcher->getParam('id', array('striptags', 'trim', 'int'), '');

        $url = $this->config->application->api_url . 'apartment/full';
        $query = array(
            'id' => $id,
            'authorized_token' => $authorizedToken,
            'cache' => 'false',
            'update_view_count' => 'true'
        );

        $url = $url . '?' . http_build_query($query);
        $cacheName = md5(serialize(array(
            'ApartmentController',
            'detailAction',
            'Api',
            $url
        )));

        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }
        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $apartment = $response['result'];
        }
        $apartmentComponent = new \ITECH\Home\Component\ApartmentComponent();
        // Related view ---------
        $params = array(
            'theme' => 'related',
            'id' => $apartment['id'],
            'limit' => 16
        );
        $relatedLayout = $apartmentComponent->listView(parent::$theme, $params);

        $breadcrumbs = [
            [
                'title' => \ITECH\Data\Lib\Constant::textLanguage('home'),
                'url' => $this->config->application->base_url,
                'active' => false
            ],
            [
                'title' => ($language == \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_VIET) ? $apartment['project_name'] : $apartment['project_name_eng'],
                'url' => $this->url->get([
                    'for' => 'project_detail',
                    'slug' => $apartment['project_slug'],
                    'id' => $apartment['project_id']
                ]),
                'active' => false
            ],
            [
                'title' => ($language == \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_VIET) ? $apartment['block_name'] : $apartment['block_name_eng'],
                'url' => $this->url->get([
                    'for' => 'block_detail',
                    'slug' => $apartment['block_slug'],
                    'id' => $apartment['block_id']
                ]),
                'active' => false
            ],
            [
                'title' => ($language == \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_VIET) ? $apartment['name'] : $apartment['name_eng'],
                'url' => '',
                'active' => true
            ]
        ];

        $url = $this->config->application->api_url . 'category/list';
        $query = array(
            'authorized_token' => $authorizedToken,
            'module' => \ITECH\Data\Lib\Constant::CATEGORY_MODULE_FENGSHUI
        );
        $rFungshei = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $query), true);

        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'apartment' => $apartment,
            'albums' => isset($albums) ? $albums : array(),
            'relatedLayout' => $relatedLayout,
            'fungshei' => $rFungshei,
            'language' => $language,
            'breadcrumbs' => $breadcrumbs
        ));
        $this->view->pick(parent::$theme . '/apartment/detail');
    }

    public function buyAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $url = $this->config->application->api_url . 'apartment/ceriterial';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['type'] = \ITECH\Data\Lib\Constant::CERITERIAL_TYPE_BUY;
        $query['cache'] = 'true';
        $query['is_home'] = \ITECH\Data\Lib\Constant::CERITERIAL_APARTMENT_IS_HOME_YES;
        $query['language'] = $this->session->get('LANGUAGE') == 'eng' ? 2 : 1;

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'ApartmentController',
            'rentAction',
            'Api',
            $url
        )));

        $ceriterialApartment = array();
        $response = $this->cache->get($cache_name);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $ceriterialApartment = $response['result'];
        }
        
        $buyLayout = array();
        $apartmentLayoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $buyLayout = $apartmentLayoutComponent->buildBlockApartment($ceriterialApartment, parent::$theme);

        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'buyLayout' => $buyLayout
        ));
        $this->view->pick(parent::$theme . '/apartment/buy');
    }

    public function rentAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $url = $this->config->application->api_url . 'apartment/ceriterial';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['type'] = \ITECH\Data\Lib\Constant::CERITERIAL_TYPE_RENT;
        $query['cache'] = 'true';
        $query['is_home'] = \ITECH\Data\Lib\Constant::CERITERIAL_APARTMENT_IS_HOME_YES;

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'ApartmentController',
            'rentAction',
            'Api',
            $url
        )));

        $ceriterialApartment = array();
        $response = $this->cache->get($cache_name);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $ceriterialApartment = $response['result'];
        }

        $rentLayout = array();
        $apartmentLayoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $rentLayout  = $apartmentLayoutComponent->buildBlockApartment($ceriterialApartment, parent::$theme);

        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'rentLayout' => $rentLayout
        ));
        $this->view->pick(parent::$theme . '/apartment/rent');
    }

    public function quickViewAjaxAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id = $this->request->getQuery('id', array('striptags', 'trim', 'int'));
        $url = $this->config->application->api_url . 'apartment/full';
        $query = array(
            'id' => $id,
            'authorized_token' => $authorizedToken,
            'cache' => 'false'
        );
        $url = $url . '?' . http_build_query($query);

        $cacheName = md5(serialize(array(
            'ApartmentController',
            'detailAction',
            'Api',
            $url
        )));

        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }

        $apartment = array();

        if (isset($response['status'])
            && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS
            && isset($response['result'])
            && count($response['result'])) {
            $apartment = $response['result'];
        }

        $this->view->setVars(array(
            'apartment_detail' => $apartment
        ));
        $this->view->pick(parent::$theme . '/apartment/quick_view_ajax');
    }

    public function contactFurnitureAjaxAction()
    {

        //$this->view->pick(parent::$theme . '/apartment/contact_furniture_ajax');
    }

    public function requestAction()
    {
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
            'message' => 'Success.'
        );

        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $id = $this->dispatcher->getParam('id');

        if ($this->request->isAjax()) {
            if ($this->request->isPost()) {
                $post = $this->request->getPost();

                $post['agent_id'] = $userSession['id'];
                $post['apartment_id'] = $id;

                if (isset($post['name'])) {
                    $post['name'] = trim(strip_tags($post['name']));
                }

                if (isset($post['phone'])) {
                    $post['phone'] = trim(strip_tags($post['phone']));
                }

                if (isset($post['email'])) {
                    $post['email'] = trim(strip_tags(strtolower($post['email'])));
                }

                if (isset($post['description'])) {
                    $post['description'] = trim(strip_tags($post['description']));
                }

                if (isset($post['pay_method'])) {
                    $post['pay_method'] = (int)$post['pay_method'];
                }

                $url = $this->config->application->api_url . 'apartment/request?apartment_id=' . $post['apartment_id'] . '&authorized_token=' . $authorizedToken;
                $requestResponse = json_decode(\ITECH\Data\Lib\Util::curlPost($url, $post), true);

                if (isset($requestResponse['status']) && $requestResponse['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Gửi yêu cầu thành công.'
                    );
                } else {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => isset($requestResponse['message']) ? $requestResponse['message'] : 'Lỗi, không thể gửi yêu cầu.'
                    );
                }
            }
        }

        RETURN_RESPONSE:
            return parent::outputJSON($response);
    }
}
