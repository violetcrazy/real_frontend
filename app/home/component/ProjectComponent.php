<?php
namespace ITECH\Home\Component;

class ProjectComponent extends \ITECH\Home\Component\BaseComponent
{
    public function home($theme, array $params)
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'project/list';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['sort_by'] = 'DESC';
        $query['sort_field'] = 'view_count';
        $query['status'] = \ITECH\Data\Lib\Constant::PROJECT_STATUS_ACTIVE;

        if (isset($params['limit'])) {
            $query['limit'] = $params['limit'];
        }

        $url = $url . '?' . http_build_query($query);
        $cache_name = md5(serialize(array(
            'ProjectComponent',
            'home',
            'Api',
            $url
        )));

        $project = array();
        $response = $this->cache->get($cache_name);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $project = $response['result'];
        }

        $this->view->start();
        $this->view->setVars(array(
            'project' => $project
        ));
        $this->view->render($theme . '/component/project/', 'home');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function footer($theme)
    {
        $this->view->start();
        $this->view->render($theme. '/component/layout/', 'footer');
        $this->view->finish();

        return $this->view->getContent();
    }

    public function searchHome($theme)
    {
        $this->view->start();
        $this->view->render($theme. '/component/layout/', 'search_home');
        $this->view->finish();

        return $this->view->getContent();
    }
}
