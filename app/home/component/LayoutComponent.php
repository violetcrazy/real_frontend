<?php
namespace ITECH\Home\Component;

class LayoutComponent extends \ITECH\Home\Component\BaseComponent
{
    public function header($theme)
    {
        $urlCurrent = @$_SERVER['REQUEST_URI'];
        $parts = parse_url($urlCurrent);

        if (isset($parts['query']) && $parts['query'] != '') {
            $output = array();
            parse_str($parts['query'], $output);

            if (count($output) > 0) {
                $output['language'] = '';
                $urlCurrent = $this->config->application->base_url . ltrim($parts['path'], '/') . '?' . http_build_query($output);
            } else {
                $urlCurrent = $this->config->application->base_url . ltrim($parts['path'], '/') . '?language=';
            }
        } else {
            $urlCurrent .= '?language=';
        }

        $language = $this->session->get('LANGUAGE');

        $this->view->start();
        $this->view->setVars(array(
            'urlCurrent' => $urlCurrent,
            'language' => $language,
            'userSession' => $this->session->get('USER'),
        ));
        $this->view->render($theme . '/component/layout/', 'header');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function footer($theme, $options)
    {
        $this->view->start();
        $this->view->setVars(array(
            'options' => $options
        ));
        $this->view->render($theme. '/component/layout/', 'footer');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function searchHome($theme)
    {
        $url = $this->config->application->api_url . 'project/list';
        $query = array();

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $query['authorized_token'] = $authorizedToken;

        $query['sort_by'] = 'ASC';
        $query['sort_field'] = 'id';

        $url = $url . '?' . http_build_query($query);
        $cacheName = md5(serialize(array(
            'LayoutComponent',
            'searchHome',
            'Api',
            $url
        )));

        $response = $this->cache->get($cacheName);
        if (!$response && $response == null) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }

        $project = array();
        if (isset($response['result']) && count($response['result'])) {
            $project = $response['result'];
        }

        $listByProvince = array();
        foreach ($project as $key => $value) {
            $listByProvince[$value['province']['name']][] = $value;
        }

        $options = parent::getOptions();

        $prices = array();
        $prices['min_price'][''] = 'Min Price';
        $prices['max_price'][''] = 'Max Price';

        if (isset($options['price_search_min']['value']) && $options['price_search_min']['value'] != '') {
            $pricesArray = json_decode($options['price_search_min']['value'], true);

            if (count($pricesArray)) {
                foreach ($pricesArray as $item) {
                    $prices['min_price'][$item] = \ITECH\Data\Lib\Util::currencyFormat($item) . ' VND';
                }
            }
        }

        if (isset($options['price_search_max']['value']) && $options['price_search_max']['value'] != '') {
            $pricesArray = json_decode($options['price_search_max']['value'], true);

            if (count($pricesArray)) {
                foreach ($pricesArray as $item) {
                    $prices['max_price'][$item] = \ITECH\Data\Lib\Util::currencyFormat($item) . ' VND';
                }
            }
        }

        $this->view->start();
        $this->view->setVars([
            'list_by_province' => $listByProvince,
            'prices' => $prices
        ]);
        $this->view->render($theme. '/component/layout/', 'search_home');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function advancedSearch($theme, array $params)
    {
        $url = $this->config->application->api_url . 'project/list';
        $aParams = array();

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $aParams['authorized_token'] = $authorizedToken;
        $aParams['sort_by'] = 'ASC';
        $aParams['sort_field'] = 'id';

        $url = $url . '?' . http_build_query($aParams);
        $cacheName = md5(serialize(array(
            'LayoutComponent',
            'advancedSearch',
            'Api',
            $url
        )));

        $project = array();
        $response = $this->cache->get($cacheName);
        if (!$response && $response == null) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $project = $response['result'];
        }

        $listByProvince = array();
        foreach ($project as $value) {
            $listByProvince[$value['province']['name']][] = $value;
        }

        $type = $params['type'];
        $location = $params['location'];
        $adults = $params['adults'];
        $children = $params['children'];

        $price = $params['price'];
        $priceMin = $params['price_min'];
        $priceMax = $params['price_max'];

        $floor = $params['floor'];

        $bedroom = $params['bedroom'];
        $bedroomMin = $params['bedroom_min'];
        $bedroomMax = $params['bedroom_max'];

        $options = parent::getOptions();

        $prices = array();
        $prices['min_price'][''] = 'Min Price';
        $prices['max_price'][''] = 'Max Price';

        if (isset($options['price_search_min']['value']) && $options['price_search_min']['value'] != '') {
            $pricesArray = json_decode($options['price_search_min']['value'], true);

            if (count($pricesArray)) {
                foreach ($pricesArray as $item) {
                    $prices['min_price'][$item] = \ITECH\Data\Lib\Util::currencyFormat($item) . ' VND';
                }
            }
        }

        if (isset($options['price_search_max']['value']) && $options['price_search_max']['value'] != '') {
            $pricesArray = json_decode($options['price_search_max']['value'], true);

            if (count($pricesArray)) {
                foreach ($pricesArray as $item) {
                    $prices['max_price'][$item] = \ITECH\Data\Lib\Util::currencyFormat($item) . ' VND';
                }
            }
        }

        $this->view->start();
        $this->view->setVars(array(
            'type' => $type,
            'location' => $location,
            'adults' => $adults,
            'price' => $price,
            'children' => $children,
            'floor' => $floor,
            'bedroom' => $bedroom,
            'list_by_province' => $listByProvince,
            'prices' => $prices,
            'priceMin' => $priceMin,
            'priceMax' => $priceMax,
            'bedroomMin' => $bedroomMin,
            'bedroomMax' => $bedroomMax
        ));
        $this->view->render($theme. '/component/layout/', 'advanced_search');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function register($theme)
    {
        $url = $this->config->application->api_url . 'location/list';
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $get = [
            'authorized_token' => $authorizedToken
        ];

        $cacheName = md5(serialize([
            'layoutRegister',
            'listProvince',
            $url . '?' . http_build_query($get)
        ]));

        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            $this->cache->save($cacheName, $response);
        }

        $listProvince = $response['result'];

        $this->view->start();
        $this->view->setVars([
            'list_province' => $listProvince
        ]);
        $this->view->render($theme. '/component/layout/', 'register');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function pagination($theme, array $params)
    {
        $url = $params['url'];
        $query = $params['query'];
        $page = $params['page'];
        $totalPages = isset($params['total_pages']) ? $params['total_pages'] : 0;
        $pagesDisplay = isset($params['pages_display']) ? $params['pages_display'] : 5;

        $url = $params['url'] . '?' . http_build_query($query);
        $paging = '';

        if ($totalPages > 1) {
            $activePage = (!$page) ? 1 : $page;

            if ($totalPages > $pagesDisplay) {
                if ($activePage < $pagesDisplay) {
                    $min = 1;
                    $max = ($activePage + $pagesDisplay);
                    $max = ($max < $totalPages) ? $max : $totalPages;
                } elseif ($activePage >= $pagesDisplay) {
                    $min = ($activePage - $pagesDisplay);
                    if ($min <= 0) {
                        $min = 1;
                    }

                    $max = ($activePage + $pagesDisplay);
                    $max = ($max < $totalPages) ? $max : $totalPages;

                    if (($totalPages > 10) && (($totalPages - $activePage) < $pagesDisplay)) {
                        $min = $min - ($pagesDisplay - ($totalPages - $activePage));
                    }
                }

                for ($i = $min; $i <= $max; $i++) {
                    $query['page'] = $i;
                    $url = $params['url'] . '?' . http_build_query($query);
                    $paging .= ($i == $activePage) ? '<li><a class="item active">' . $i . '</a></li>' : '<li><a class="item" href="'. $url .'" title="Trang ' . $i . '">' . $i . '</a></li>';
                }
            } else {
                for ($i = 1; $i <= $totalPages; $i++) {
                    $query['page'] = $i;
                    $url = $params['url'] . '?' . http_build_query($query);
                    $paging .= ($i == $activePage) ? '<li><a class="item active" title="Trang '.$i.'">' . $i . '</a></li>' : '<li><a class="item" href="' . $url . '" title="Trang ' . $i . '">' . $i . '</a></li>';
                }
            }

            if ($activePage > 1) {
                $query['page'] = $activePage - 1;
                $url = $params['url'] . '?' . http_build_query($query);
                $paging = '<li><a class="first" title="Trang trước" href="' . $url .'"></a></li>' . $paging;
            }

            if ($activePage < $totalPages) {
                $query['page'] = $activePage + 1;
                $url = $params['url'] . '?' . http_build_query($query);
                $paging .= '<li><a class="last" title="Trang kế tiếp" href="'. $url .'"></a></li>';

                $query['page'] = $totalPages;
                $url = $params['url'] . '?' . http_build_query($query);
                $paging .= '<li><a class="item" title="Trang cuối" href="'. $url .'">»</a></li>';
            }

            $query['page'] = 1;
            $url = $params['url'] . '?' . http_build_query($query);
            $paging = '<li><a class="item" title="Trang đầu tiên" href="' . $url . '">«</a></li>' . $paging;
        }

        $this->view->start();
        $this->view->setVars(array(
            'totalPages' => $totalPages,
            'paging' => $paging,
            'page' => $page,
            'pagesDisplay' => $pagesDisplay,
            'limit' => isset($params['limit']) ? $params['limit'] : 0,
            'total_items' => isset($params['total_items']) ? $params['total_items'] : 0
        ));
        $this->view->render($theme . '/component/layout/', 'pagination');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function buildBlockApartment($ceriterialApartment, $theme)
    {
        $apartmentComponent = new \ITECH\Home\Component\ApartmentComponent();

        $prefix = '';
        if ($this->session->get('LANGUAGE') == 'eng'){
            $prefix = '_eng';
        }

        $buyLayout = array();
        if (count($ceriterialApartment)) {
            $limit = \ITECH\Data\Lib\Constant::getCeriterialTemplateValue();

            foreach ($ceriterialApartment as $item) {
                $filter = array();

                if ($item['attribute_type' . $prefix] != '') {
                    $attribute = explode('-', $item['attribute_type' . $prefix]);
                    if (count($attribute)) {
                        foreach ($attribute as $v) {
                            if ($v != '') {
                                $filter[] = $v;
                            }
                        }
                    }
                }

                if ($item['attribute_view' . $prefix] != '') {
                    $attribute = explode('-', $item['attribute_view' . $prefix]);
                    if (count($attribute)) {
                        foreach ($attribute as $v) {
                            if ($v != '') {
                                $filter[] = $v;
                            }
                        }
                    }
                }

                if ($item['attribute_utility' . $prefix] != '') {
                    $attribute = explode('-', $item['attribute_utility' . $prefix]);
                    if (count($attribute)) {
                        foreach ($attribute as $v) {
                            if ($v != '') {
                                $filter[] = $v;
                            }
                        }
                    }
                }

                $params = array(
                    'header_title' => $item['name'  . $prefix],
                    'theme' => $item['template'],
                    'limit' => isset($limit[$item['template']]) ? $limit[$item['template']] : 0,
                    'filter' => $filter,
                    'search_query' => $item['search_query' . $prefix]
                );

                if (isset($item['price_min'  . $prefix]) && $item['price_min'  . $prefix] > 0 ) {
                    $params['price_min'  . $prefix] = (int)$item['price_min'  . $prefix];
                }

                if (isset($item['price_max'  . $prefix]) && $item['price_max'  . $prefix] > 0) {
                    $params['price_max'  . $prefix] = (int)$item['price_max'  . $prefix];
                }

                if ($item['direction'  . $prefix] != '') {
                    $attribute = explode('-', $item['direction'  . $prefix]);
                    $trend = array();

                    if (count($attribute)) {
                        foreach ($attribute as $v) {
                            if ($v != '') {
                                $trend[] = $v;
                            }
                        }
                    }

                    $params['trend'] = $trend;
                }

                if ($item['is_new'] != '') {
                    $params['is_new'] = (int)$item['is_new'];
                }

                if ($item['type'] != '') {
                    $params['type'] = (int)$item['type'];
                }
                echo $theme;
                $buyLayout[$item['id']] = $apartmentComponent->listView($theme, $params);
            }
        }
        return $buyLayout;
    }
}
