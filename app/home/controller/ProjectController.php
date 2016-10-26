<?php
namespace ITECH\Home\Controller;

class ProjectController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function detailAction()
    {
        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim', 'lower'), '');

        $url = $this->config->application->api_url . 'project/full?id=' . $id . '&authorized_token=' . $authorizedToken . '&update_view_count=true';
        $cacheName = md5(serialize(array(
            'ProjectController',
            'detailAction',
            'Api',
            $url
        )));
        //var_dump($url); die;
        $project = $this->cache->get($cacheName);
        if (!$project) {
            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);

            if (isset($r['result']) && count($r['result'])) {
                $project = $r['result'];
            }

            $this->cache->save($cacheName, $project);
        }

        if ($this->request->hasQuery('list') && $this->request->getQuery('list') == 'block') {
            $url = $this->config->application->api_url . 'block/list-by-project';
            $get = array(
                'project_id' => $project['id'],
                'authorized_token' => $authorizedToken,
            );

            $block = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            if ($block['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                $project['blocks'] = $block['result'];
            }
        }

        $url = $this->config->application->api_url . 'project/other-project';
        $get = [
            'limit' => 10,
            'project_id' => $project['id'],
            'authorized_token' => $authorizedToken,
            'cache' => 'true'
        ];

        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result'])) {
            $otherProject = $r['result'];
        } else {
            $otherProject = '';
        }

        $breadcrumbs[] = array(
            'title' => \ITECH\Data\Lib\Constant::textLanguage('home'),
            'url' => $this->config->application->base_url,
            'active' => false
        );
        $breadcrumbs[] = array(
            'title' => $project['name'],
            'url' => $this->url->get(array(
                'for' => 'project_detail',
                'slug' => $project['slug'],
                'id' => $project['id'])),
            'active' => true
        );
        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'project' => $project,
            'breadcrumbs' => $breadcrumbs,
            'other_project' => $otherProject
        ));
        $this->view->pick(parent::$theme . '/project/detail');
    }

    public function listAction()
    {
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->config->application->project_pagination_limit;

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'project/list';

        $params = array(
            'page' => $page,
            'limit' => $limit,
            'authorized_token' => $authorizedToken
        );
        $cacheName = md5(serialize(array(
            'ProjectController',
            'ListAction',
            'Api',
            $params
        )));

        $projects = $this->cache->get($cacheName);
        if (!$projects) {
            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $params), true);

            if ($r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && count($r['result'])) {
                $projects = $r;
            }

            $this->cache->save($cacheName, $projects);
        }

        $total_items = $projects['total_items'];
        $total_pages = $projects['total_pages'];
        $query['page'] = $page;

        $url = $this->url->get(array('for' => 'project_list'));
        $options = array(
            'url' => $url,
            'query' => $query,
            'total_pages' => $total_pages,
            'page' => $page,
            'pages_display' => 5,
            'limit' => $limit,
            'total_items' => $total_items
        );
        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $paginationLayout = $layoutComponent->pagination(parent::$theme, $options);

        $breadcrumbs[] = array(
            'title' => \ITECH\Data\Lib\Constant::textLanguage('home'),
            'url' => $this->config->application->base_url,
            'active' => false
        );
        $breadcrumbs[] = array(
            'title' => \ITECH\Data\Lib\Constant::textLanguage('project_list'),
            'url' => '',
            'active' => true
        );
        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'projects' => $projects,
            'page' => $page,
            'breadcrumbs' => $breadcrumbs,
            'paginationLayout' => $paginationLayout
        ));
        $this->view->pick(parent::$theme . '/project/list');
    }
}
