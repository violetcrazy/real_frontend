<?php
namespace ITECH\Home\Controller;

class SearchController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $q = $this->request->getQuery('q', array('striptags', 'trim'), '');
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->request->getQuery('search_limit', array('striptags', 'trim', 'int'), $this->config->application->pagination_limit);
        $sortByPrice = $this->request->getQuery('sort_by_price', array('int'), 1);

        $type = $this->request->getQuery('type', array('int'), '');
        $location = $this->request->getQuery('location', array('striptags', 'trim', 'lower'), '');
        $adults = $this->request->getQuery('adults', array('int'), '');
        $children = $this->request->getQuery('children', array('int'), '');

        $price = $this->request->getQuery('price', array('striptags', 'trim', 'lower'), '');
        $priceMin = $this->request->getQuery('price_min', array('int'), '');
        $priceMax = $this->request->getQuery('price_max', array('int'), '');

        $area = $this->request->getQuery('area', array('striptags', 'trim'), '');
        $floor = $this->request->getQuery('floor', array('int'), '');

        $bedroom = $this->request->getQuery('bedroom', array('int'), '');
        $bedroomMin = $this->request->getQuery('bedroom_min', array('int'), '');
        $bedroomMax = $this->request->getQuery('bedroom_max', array('int'), '');
        $bedroomCount = $this->request->getQuery('bedroom_count', array('int'), '');
        $bathroomCount = $this->request->getQuery('bathroom_count', array('int'), '');

        $projectIds = $this->request->getQuery('project_ids');
        $cid = $this->request->getQuery('cid', array('int'), '');

        $querySearch = array();
        if ($this->request->isGet()){
            $querySearch = $this->request->getQuery();
        }

        $attributes = array();
        $trends = array();

        $attType = array();
        $attView = array();
        $attTrend = array();
        $attUtility = array();

        $attEnergy = array();
        $attEntertaining = array();
        $attEnvironment = array();
        $attSecurity = array();

        if ($this->request->getQuery('att_type')) {
            $attType = $this->request->getQuery('att_type');
        }

        if ($this->request->getQuery('att_view')) {
            $attView = $this->request->getQuery('att_view');
        }

        if ($this->request->getQuery('att_trend')) {
            $attTrend = $this->request->getQuery('att_trend');
        }

        if ($this->request->getQuery('att_utility')) {
            $attUtility = $this->request->getQuery('att_utility');
        }

        if ($this->request->getQuery('att_energy')) {
            $attEnergy = $this->request->getQuery('att_energy');
        }

        if ($this->request->getQuery('att_entertaining')) {
            $attEntertaining = $this->request->getQuery('att_entertaining');
        }

        if ($this->request->getQuery('att_environment')) {
            $attEnvironment = $this->request->getQuery('att_environment');
        }

        if ($this->request->getQuery('att_security')) {
            $attSecurity = $this->request->getQuery('att_security');
        }

        if ($location != '') {
            $getLocation = array_filter(explode('-', $location));

            if (isset($getLocation[1])) {
                $projectId = $getLocation[1];
            }
        }

        // --------- Attributes type
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_TYPE;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesType = $this->cache->get($cacheName);
        if (!$attributesType) {
            $attributesType = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesType = $r['result'];
            }

            $this->cache->save($cacheName, $attributesType);
        }

        if (count($attType) && count($attributesType)) {
            foreach ($attType as $a) {
                foreach ($attributesType as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes type ---------

        // --------- Attributes view
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_VIEW;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesView = $this->cache->get($cacheName);
        if (!$attributesView) {
            $attributesView = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesView = $r['result'];
            }

            $this->cache->save($cacheName, $attributesView);
        }

        if (count($attView) && count($attributesView)) {
            foreach ($attView as $a) {
                foreach ($attributesView as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes view ---------

        // --------- Attributes utility
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_UTILITY;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesUtility = $this->cache->get($cacheName);
        if (!$attributesUtility) {
            $attributesUtility = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesUtility = $r['result'];
            }

            $this->cache->save($cacheName, $attributesUtility);
        }

        if (count($attUtility) && count($attributesUtility)) {
            foreach ($attUtility as $a) {
                foreach ($attributesUtility as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes utility ---------

        // --------- Attributes energy
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_ENERGY_CONTROL_SYSTEM;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesEnergy = $this->cache->get($cacheName);
        if (!$attributesEnergy) {
            $attributesEnergy = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesEnergy = $r['result'];
            }

            $this->cache->save($cacheName, $attributesEnergy);
        }

        if (count($attEnergy) && count($attributesEnergy)) {
            foreach ($attEnergy as $a) {
                foreach ($attributesEnergy as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes energy ---------

        // --------- Attributes entertaining
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_ENTERTAINING_CONTROL_SYSTEM;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesEntertaining = $this->cache->get($cacheName);
        if (!$attributesEntertaining) {
            $attributesEntertaining = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesEntertaining = $r['result'];
            }

            $this->cache->save($cacheName, $attributesEntertaining);
        }

        if (count($attEntertaining) && count($attributesEntertaining)) {
            foreach ($attEntertaining as $a) {
                foreach ($attributesEntertaining as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes entertaining ---------

        // --------- Attributes environment
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_ENVIRONMENT_CONTROL_SYSTEM;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesEnvironment = $this->cache->get($cacheName);
        if (!$attributesEnvironment) {
            $attributesEnvironment = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesEnvironment = $r['result'];
            }

            $this->cache->save($cacheName, $attributesEnvironment);
        }

        if (count($attEnvironment) && count($attributesEnvironment)) {
            foreach ($attEnvironment as $a) {
                foreach ($attributesEnvironment as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes environment ---------

        // --------- Attributes securiy
        $module = \ITECH\Data\Lib\Constant::ATTRIBUTE_MODULE_APARTMENT;
        $aType = \ITECH\Data\Lib\Constant::APARTMENT_ATTRIBUTE_TYPE_SECURITY_CONTROL_SYSTEM;
        $url = $this->config->application->api_url . 'home/attribute-list?module=' . $module . '&type=' . $aType . '&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $attributesSecurity = $this->cache->get($cacheName);
        if (!$attributesSecurity) {
            $attributesSecurity = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $attributesSecurity = $r['result'];
            }

            $this->cache->save($cacheName, $attributesSecurity);
        }

        if (count($attSecurity) && count($attributesSecurity)) {
            foreach ($attSecurity as $a) {
                foreach ($attributesSecurity as $at) {
                    if ($at['slug'] == $a) {
                        $attributes['attributes[' . $at['id'] . ']'] = $at['id'];
                    }
                }
            }
        }
        // Attributes security ---------

        $attributesTrend = \ITECH\Data\Lib\Constant::getTrend();

        if (count($attTrend) && count($attributesTrend)) {
            foreach ($attTrend as $a) {
                foreach ($attributesTrend as $k => $at) {
                    if ($k == $a) {
                        $trends['trends[' . $k . ']'] = $k;
                    }
                }
            }
        }

        if ($type != 1 && $type != 2) {
            $type = '';
        }

        // Advanced search ---------
        $sParams = array();
        $sParams['type'] = $type;
        $sParams['location'] = $location;
        $sParams['adults'] = $adults;
        $sParams['children'] = $children;
        $sParams['floor'] = $floor;

        $sParams['bedroom'] = $bedroom;
        $sParams['bedroom_min'] = $bedroomMin;
        $sParams['bedroom_max'] = $bedroomMax;

        $sParams['price'] = $price;
        $sParams['price_min'] = $priceMin;
        $sParams['price_max'] = $priceMax;

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent($sParams);
        $advancedSearchLayout = $layoutComponent->advancedSearch(parent::$theme, $sParams);
        // --------- Advanced search

        $aParams = array();
        $query = array();

        $aParams['authorized_token'] = $authorizedToken;

        if ($q != '') {
            $aParams['q'] = $q;
            $query['q'] = $q;
        }

        if (isset($projectId) && $projectId != '') {
            $aParams['project_id'] = $projectId;
            $query['project_id'] = $projectId;
        } elseif ($location != '') {
            $aParams['location'] = $location;
            $query['location'] = $location;
        }

        if (count($projectIds)) {
            $aParams['project_ids'] = $projectIds;
            $query['project_ids'] = $projectIds;
        }

        if ($area != '') {
            $aParams['area'] = $area;
            $query['area'] = $area;
        }

        if ($bedroomCount != '') {
            $aParams['bedroom_count'] = $bedroomCount;
            $query['bedroom_count'] = $bedroomCount;
        }

        if ($bedroomMin != '') {
            $aParams['bedroom_min'] = $bedroomMin;
            $query['bedroom_min'] = $bedroomMin;
        }

        if ($bedroomMax != '') {
            $aParams['bedroom_max'] = $bedroomMax;
            $query['bedroom_max'] = $bedroomMax;
        }

        if ($bathroomCount != '') {
            $aParams['bathroom_count'] = $bathroomCount;
            $query['bathroom_count'] = $bathroomCount;
        }

        if ($priceMin != '') {
            $aParams['price_min'] = $priceMin;
            $query['price_min'] = $priceMin;
        }

        if ($priceMax != '') {
            $aParams['price_max'] = $priceMax;
            $query['price_max'] = $priceMax;
        }

        if ($bedroom != '') {
            $aParams['bedroom'] = $bedroom;
            $query['bedroom'] = $bedroom;
        }

        if ($type != '') {
            $aParams['type'] = $type;
            $query['type'] = $type;
        }

        if ($adults != '') {
            $aParams['adults'] = $adults;
            $query['adults'] = $adults;
        }

        if ($children != '') {
            $aParams['children'] = $children;
            $query['children'] = $children;
        }

        if ($cid != '') {
            $query['cid'] = $cid;
        }

        if ($floor != '') {
            $aParams['floor'] = $floor;
            $query['floor'] = $floor;
        }

        $aParams['page'] = $page;
        $aParams['limit'] = $limit;

        $query['search_limit'] = $limit;

        if ($sortByPrice != '') {
            switch ($sortByPrice) {
                case 1:
                    $aParams['sort_field'] = 'price';
                    $aParams['sort_by'] = 'ASC';
                break;

                case 2:
                    $aParams['sort_field'] = 'price';
                    $aParams['sort_by'] = 'DESC';
                break;
            }

            $query['sort_by_price'] = $sortByPrice;
        }

        if (count($attType)) {
            foreach ($attType as $key => $value) {
                if ($value != '') {
                    $query['att_type[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attView)) {
            foreach ($attView as $key => $value) {
                if ($value != '') {
                    $query['att_view[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attUtility)) {
            foreach ($attUtility as $key => $value) {
                if ($value != '') {
                    $query['att_utility[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attTrend)) {
            foreach ($attTrend as $key => $value) {
                if ($value != '') {
                    $query['att_trend[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attEnergy)) {
            foreach ($attEnergy as $key => $value) {
                if ($value != '') {
                    $query['att_energy[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attEntertaining)) {
            foreach ($attEntertaining as $key => $value) {
                if ($value != '') {
                    $query['att_entertaining[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attEnvironment)) {
            foreach ($attEnvironment as $key => $value) {
                if ($value != '') {
                    $query['att_environment[' . $key . ']'] = $value;
                }
            }
        }

        if (count($attSecurity)) {
            foreach ($attSecurity as $key => $value) {
                if ($value != '') {
                    $query['att_security[' . $key . ']'] = $value;
                }
            }
        }

        $url = $this->config->application->api_url . 'search';
        $url = $url . '?' . http_build_query($aParams);
        //var_dump($url); die;
        if (count($attributes)) {
            $attributesQuery = http_build_query($attributes);
            $url = $url . '&' . $attributesQuery;
        }

        if (count($trends)) {
            $trendsQuery = http_build_query($trends);
            $url = $url . '&' . $trendsQuery;
        }

        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);

        $apartment = array();
        $total_items = 0;
        $total_pages = 0;

        if (isset($r['result']) && count($r['result'])) {
            $apartment = $r['result'];
            $total_items = $r['total_items'];
            $total_pages = $r['total_pages'];
        }
        $query['page'] = $page;

        $url = $this->url->get(array('for' => 'search'));
        $options = array(
            'url' => $url,
            'query' => $query,
            'total_pages' => $total_pages,
            'page' => $page,
            'pages_display' => 5,
            'limit' => $limit,
            'total_items' => $total_items
        );

        $article_max = $page * $limit;
        $article_min = $article_max - $limit + 1;
        if ($article_max > $total_items) {
            $article_max = $total_items;
        }

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $paginationLayout = $layoutComponent->pagination(parent::$theme, $options);

        // --------- Smart search
        $url = $this->config->application->api_url . 'apartment/ceriterial';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['type'] = \ITECH\Data\Lib\Constant::CERITERIAL_TYPE_SMART_SEARCH;
        $query['cache'] = 'true';

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'SearchController',
            'indexAction',
            'Api',
            $url
        )));

        $smartSearch = array();
        $response = $this->cache->get($cache_name);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $smartSearch = $response['result'];
        }
        // Smart search ---------

        $this->view->setVars([
            'advancedSearchLayout' => $advancedSearchLayout,
            'apartment' => $apartment,
            'querySearch' => $querySearch,
            'total_items' => $total_items,
            'article_min' => $article_min,
            'article_max' => $article_max,
            'price' => $price,
            'adults' => $adults,
            'children' => $children,
            'limit' => $limit,
            'sortByPrice' => $sortByPrice,
            'paginationLayout' => $paginationLayout,
            'attType' => $attType,
            'attView' => $attView,
            'attTrend' => $attTrend,
            'attUtility' => $attUtility,
            'attEnergy' => $attEnergy,
            'attEntertaining' => $attEntertaining,
            'attEnvironment' => $attEnvironment,
            'attSecurity' => $attSecurity,
            'smartSearch' => $smartSearch,
            'cid' => $cid,
            'page' => $page
        ]);
        $this->view->pick(parent::$theme . '/search/index');
    }

    public function createUrlAjaxAction(){
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
            'message' => 'Lỗi. Dữ liệu không đúng.'
        );

        if ($this->request->isGet()){

            $querySearch = $this->request->getQuery();
            unset($querySearch['_url']);

            $q = array();

            foreach ($querySearch as $key => $item) {
                if (is_array($item)) {
                    $qq = array();
                    foreach ($item as $keys => $items) {
                        $qq[$key][$items] = $items;
                    }
                    foreach ($qq[$key] as $keys => $items) {
                        $q[$key][] = $items;
                    }
                } else {
                    if (!$item || $item == '0') {
                        unset($querySearch[$key]);
                    } else {
                        $q[$key] = $item;
                    }
                }
            }

            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                'message' => 'Thành công.',
                'result' => '?' . http_build_query($q)
            );
        }

        parent::outputJSON($response);
    }
}