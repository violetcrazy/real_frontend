<?php
namespace ITECH\Home\Component;

class ApartmentComponent extends \ITECH\Home\Component\BaseComponent
{
    public function listView($theme, array $params)
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $query = array();

        $url = $this->config->application->api_url . 'apartment/list';
        $query['authorized_token'] = $authorizedToken;

        if ($this->session->has('USER')) {
            $userSession = $this->session->get('USER');
            $query['user_id'] = $userSession['id'];
        }

        $query['sort_by'] = 'ASC';
        $query['sort_field'] = 'id';
        $query['cache'] = 'false';

        if (isset($params['limit'])) {
            $query['limit'] = ($theme == 'mobile') ? 3 : $params['limit'];
        }

        if (isset($params['filter'])) {
            $query['attributes'] = $params['filter'];
        }

        if (isset($params['price_min'])) {
            $query['price_min'] = $params['price_min'];
        }

        if (isset($params['price_max'])) {
            $query['price_max'] = $params['price_max'];
        }

        if (isset($params['trend'])) {
            $query['trends'] = $params['trend'];
        }

        if (isset($params['type'])) {
            $query['type'] = $params['type'];
        }

        if (isset($params['id'])) {
            $query['id'] = $params['id'];
        }

        $url = $url . '?' . http_build_query($query);
        
        $totalItems = 0;
        $apartments = array();

        $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);

        if (isset($response['result']) && count($response['result'])) {
            $apartments = $response['result'];
        }

        if (isset($params['theme']) && $params['theme'] != '') {
            $themeView = $params['theme'];
        } else {
            $themeView = '1_big_4_small';
        }

        if (isset($params['header_title'])) {
            $headerTitle = $params['header_title'];
        } else {
            $headerTitle = $this->session->get('LANGUAGE') == 'eng' ? 'Apartment' : 'Căn hộ';
        }

        if (isset($response['total_items'])) {
            $totalItems = $response['total_items'];
        }
        $this->view->start();
        $this->view->setVars(array(
            'headerTitle' => $headerTitle,
            'results' => $apartments,
            'totalItems' => $totalItems,
            'searchQuery' => isset($params['search_query']) ? $params['search_query'] : ''
        ));

        $this->view->render($theme . '/component/apartment/', $themeView);
        $this->view->finish();

        return $this->view->getContent();
    }
}
