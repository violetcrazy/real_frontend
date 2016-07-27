<?php
namespace ITECH\Home\Component;

class ArticleComponent extends \ITECH\Home\Component\BaseComponent
{
    public function listView($theme, array $params)
    {
        $query = array();

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'article/list';
        $query = array();
        $query['authorized_token'] = $authorizedToken;

        $query['sort_by'] = 'DESC';
        $query['sort_field'] = 'id';
        $query['module'] = \ITECH\Data\Lib\Constant::ARTICLE_MODULE_POST;
        $query['status'] = \ITECH\Data\Lib\Constant::ARTICLE_STATUS_ACTIVE;

        if (isset($params['limit'])) {
            $query['limit'] = $params['limit'];
        }

        if (isset($params['category']) && count($params['category'])) {
            $query['category_id'] = $params['category']['id'];
        }

        if (isset($params['type'])) {
            $query['type'] = $params['type'];
        }

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'ApartmentComponent',
            'listView',
            'Api',
            $url
        )));

        $articles = array();
        $response = $this->cache->get($cache_name);

        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $articles = $response['result'];
        }

        if (isset($params['theme']) && $params['theme'] != '') {
            $themeView = $params['theme'];
        } else {
            $themeView = '2_big_5_small';
        }

        if (isset($params['header_title'])) {
            $headerTitle = $params['header_title'];
        } else {
            $headerTitle = 'Căn hộ';
        }

        $this->view->start();
        $this->view->setVars(array(
            'results' => $articles,
            'category' => isset($params['category']) ? $params['category'] : array()
        ));
        $this->view->render($theme . '/component/article/', $themeView);
        $this->view->finish();

        return $this->view->getContent();
    }
}