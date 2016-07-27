<?php
namespace ITECH\Home\Controller;

class ArticleController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function listAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        //$slug = $this->dispatcher->getParam('slug', array('striptags', 'trim'), '');
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim', 'int'), '');
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->config->application->pagination_limit;

        $url = $this->config->application->api_url . 'home/category-detail';
        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['id'] = $id;
        $url = $url . '?' . http_build_query($query);

        $category = array();
        $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $category = $response['result'];
        }

        if (!count($category)) {
            throw new \Phalcon\Exception('Không tồn tại liên kết này.');
        }

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $url = $this->config->application->api_url . 'article/list';

        $query = array();
        $query['authorized_token'] = $authorizedToken;

        $query['sort_by'] = 'ASC';
        $query['sort_field'] = 'id';
        $query['model'] = \ITECH\Data\Lib\Constant::ARTICLE_MODULE_POST;
        $query['category_id'] = $category['id'];
        $query['limit'] = $limit;
        $query['page'] = $page;

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'ArticleController',
            'listAction',
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
            $total_items = $response['total_items'];
            $total_pages = $response['total_pages'];
        }

        $query = array();
        $query['page'] = $page;

        $url = $this->url->get(array('for' => 'article_list', 'slug' => $category['slug'], 'id' => $category['id']));
        $options = array(
            'url' => $url,
            'query' => $query,
            'total_pages' => isset($total_pages) ? $total_pages : 0,
            'page' => $page,
            'pages_display' => 5,
            'limit' => $limit,
            'total_items' => $total_items
        );

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $paginationLayout = $layoutComponent->pagination(parent::$theme, $options);

        // List category ---------
        $url = $this->config->application->api_url . 'home/category-list';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['parent_id'] = (int) 0;
        $query['no_id'] = (int) $category['id'];
        $query['status'] = \ITECH\Data\Lib\Constant::CATEGORY_STATUS_ACTIVE;
        $query['cache'] = 'false';
        $url = $url . '?' . http_build_query($query);

        $categories = array();
        $cacheName = md5(serialize(array(
            'ArticleController',
            'listByCategoryAction',
            'Api',
            $url
        )));

        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }

        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $categories = $response['result'];
        }
        // --------- List category
        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'articles' => $articles,
            'paginationLayout' => $paginationLayout,
            'category' => $category,
            'categories' => $categories

        ));
        $this->view->pick(parent::$theme . '/article/list');
    }

    public function listByCategoryAction()
    {
        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        // List category ---------
        $url = $this->config->application->api_url . 'home/category-list';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['parent_id'] = (int) 0;
        $query['status'] = \ITECH\Data\Lib\Constant::CATEGORY_STATUS_ACTIVE;
        $query['cache'] = false;
        $query['module'] = \ITECH\Data\Lib\Constant::CATEGORY_MODULE_ARTICLE;
        
        $url = $url . '?' . http_build_query($query);

        $categories = array();
        $cacheName = md5(serialize(array(
            'ArticleController',
            'listByCategoryAction',
            'Api',
            $url
        )));

        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cacheName, $response);
        }

        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $categories = $response['result'];
        }
        // --------- List category

        // List article by category ---------
        $articleByCategoryLayout = array();
        if (count($categories)) {
            $articleComponent = new \ITECH\Home\Component\ArticleComponent();
            foreach ($categories as $key => $item) {
                if ($key == 0) {
                    $theme = '1_big_4_small';
                } else {
                    $theme = '2_big_5_small';
                }

                $params = array(
                    'category' => $item,
                    'theme' => $theme,
                    'limit' => (int) 5,
                    'type' => \ITECH\Data\Lib\Constant::ARTICLE_TYPE_DEFAULT

                );
                $articleByCategoryLayout[$item['id']] = $articleComponent->listView(parent::$theme, $params);
            }
        }
        // --------- List article by category
        // Article hot ---------
        $articleHotLayout = array();
        $articleComponent = new \ITECH\Home\Component\ArticleComponent();
        $params = array();
        $params = array(
            'theme' => 'hot',
            'limit' => (int) 5,
            'type' => \ITECH\Data\Lib\Constant::ARTICLE_TYPE_FOCUS

        );

        $articleHotLayout = $articleComponent->listView(parent::$theme, $params);
        // --------- List article by category
        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'categories' => $categories,
            'articleByCategoryLayout' => $articleByCategoryLayout,
            'articleHotLayout' => $articleHotLayout
        ));
        $this->view->pick(parent::$theme . '/article/list_by_category');
    }

    public function detailAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        //$slug = $this->dispatcher->getParam('slug', array('striptags', 'trim'), '');
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim', 'int'), '');
        //$page = $this->request->getQuery('page', array('int'), 1);
        //$limit = $this->config->application->pagination_limit;

        $url = $this->config->application->api_url . 'article/detail';
        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['id'] = $id;
        $url = $url . '?' . http_build_query($query);
        
        $article = array();
        $categories = array();
        
        $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
        if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result']) && count($response['result'])) {
            $article = $response['result'];
            $categories = $article['categories'];
        }

        if (!count($article)) {
            throw new \Phalcon\Exception('Không tồn tại liên kết này.');
        }

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);
        // List article by category ---------
        $articleByCategoryLayout = array();
        $categorySeo = array();
        
        if (count($categories)) {
            $articleComponent = new \ITECH\Home\Component\ArticleComponent();
            foreach ($categories as $key => $item) {
                if ($key) {}

                $params = array(
                    'category' => $item,
                    'theme' => 'list_by_category_in_detail',
                    'limit' => (int) 5

                );
                $categorySeo[] = '<a href="' . $this->url->get(array('for' => 'article_list', 'slug' => $item['slug'], 'id' => $item['id'])) . '" title="' . $item['name'] . '">' . $item['name'] . '</a>';
                $articleByCategoryLayout[$item['id']] = $articleComponent->listView(parent::$theme, $params);
            }
        }
        // --------- List article by category

        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'article' => $article,
            'articleByCategoryLayout' => $articleByCategoryLayout,
            'categories' => $categories,
            'categorySeo' => $categorySeo

        ));
        $this->view->pick(parent::$theme . '/article/detail');
    }
}