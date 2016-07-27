<?php
namespace ITECH\Home\Controller;

class BlockController extends \ITECH\Home\Controller\BaseController
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
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->request->getQuery('search_limit', array('striptags', 'trim', 'int'), $this->config->application->pagination_limit);
        $type_view = $this->request->getQuery('type_view', array('striptags', 'trim'), \ITECH\Data\Lib\Constant::TYPE_IMAGE_VIEW);
        $floor_count = $this->request->getQuery('floor_count', array('striptags', 'trim'), 1);

        $url = $this->config->application->api_url . 'block/full';
        $get = [
            'id' => $id,
            'authorized_token' => $authorizedToken,
            'update_view_count' => 'true'
        ];
        $block = array();
        $api = $url . '?' . http_build_query($get);
        //var_dump($api); die;
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result'])) {
            $block = $r['result'];
        }

        $breadcrumbs = [
            [
                'title' => \ITECH\Data\Lib\Constant::textLanguage('home'),
                'url' => $this->config->application->base_url,
                'active' => false
            ],
            [
                'title' => $block['project']['name'],
                'url' => $this->url->get([
                    'for' => 'project_detail',
                    'slug' => $block['project']['slug'],
                    'id' => $block['project']['id']
                ]),
                'active' => false
            ],
            [
                'title' => $block['name'],
                'url' => $this->url->get([
                    'for' => 'block_detail',
                    'slug' => $block['slug'],
                    'id' => $block['id']
                ]),
                'active' => true
            ]
        ];

        $url = $this->config->application->api_url . 'block/list-by-project';
        $get = [
            'cache' => 'false',
            'project_id' => $block['project']['id'],
            'authorized_token' => $authorizedToken
        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url,$get), true);
        $otherBlock = [];
        if (isset($r['result']) && count($r['result'])) {
            $blocks = $r['result'];
            foreach ($blocks as $key => $item) {
                if ($item['id'] != $block['id']) {
                    $otherBlock[] = $item;
                }
            }
        } else {
            $this->flashSession->success('Không tìm thấy block nào.');
        }

        if ($type_view == \ITECH\Data\Lib\Constant::TYPE_IMAGE_VIEW) {
            $tmp = array();
            $url = $this->config->application->api_url . 'map-image/detail-image-view';
            $get = [
                'cache' => 'false',
                'item_id' => $id,
                'module' => \ITECH\Data\Lib\Constant::MAP_IMAGE_MODULE_BLOCK,
                'authorized_token' => $authorizedToken
            ];
            $api = $url . '?' . http_build_query($get);
            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url,$get), true);
            if (isset($r['result']) && count($r['result'])) {
                $imageView = $r['result']['imageView'];
                $image_default = $r['result']['image_default'];
                foreach ($imageView as $key => $value) {
                    $tmp[$key]['id'] = $value['id'];
                    $tmp[$key]['image_map_id'] = $value['image_map_id'];
                    $tmp[$key]['apartment_name'] = $value['apartment_name'];
                    $tmp[$key]['apartment_id'] = $value['apartment_id'];
                    $data = (array)json_decode($value['map']);
                    $tmp[$key]['coords'] = $data['coords'];
                    $tmp[$key]['strokeColor'] = $data['data-maphilight']->strokeColor;
                    $tmp[$key]['fillColor'] = $data['data-maphilight']->fillColor;
                }
            } else {
                $imageView = '';
                $url = $this->config->application->api_url . 'map-image/full';
                $get = [
                    'cache' => 'false',
                    'item_id' => $id,
                    'module' => \ITECH\Data\Lib\Constant::MAP_IMAGE_MODULE_BLOCK,
                    'type' => 1,
                    'authorized_token' => $authorizedToken
                ];
                $api = $url . '?' . http_build_query($get);
                $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url,$get), true);
                if (isset($r['result']) && count($r['result'])) {
                   $image_default = $r['result'][0]['image'];
                } else {
                    $image_default = '';
                }
            }
            $this->view->setVars(array(
                'imageView' => $tmp,
                'image_default' => $image_default
            ));
        }

        if ($type_view == \ITECH\Data\Lib\Constant::TYPE_PLAN_VIEW) {
            $url = $this->config->application->api_url . 'map-image/detail-plan-view';
            $get = [
                'cache' => 'false',
                'item_id' => $id,
                'module' => \ITECH\Data\Lib\Constant::MAP_IMAGE_MODULE_BLOCK,
                'type' => 2,
                'authorized_token' => $authorizedToken
            ];
            $api = $url . '?' . http_build_query($get);
            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url,$get), true);
            if (isset($r['result']) && count($r['result'])) {
                $planView = $r['result'];
            } else {
                $planView = '';
            }
            $this->view->setVars(array(
                'planView' => $planView,
            ));

        }

        $url = $this->config->application->api_url . 'apartment/list';
        $params = array(
            'block_id' => $block['id'],
            'floor_count' => $floor_count,
            'authorized_token' => $authorizedToken,
            'page' => $page,
        );
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url,$params), true);
        if (isset($r['result']) && count($r['result'])) {
            $list_apartment_block = $r['result'];
            $total_pages = $r['total_pages'];
            $total_items = $r['total_items'];
            $url = $this->url->get(array('for' => 'block_detail', 'slug' => $block['slug'], 'id' => $block['id'] ));
            $query = array(
                'floor_count' => $floor_count,
                'type' => $this->request->getQuery('type')
            );
            $options = array(
                'url' => $url,
                'query' => $query,
                'total_pages' => $total_pages,
                'page' => $page,
                'pages_display' => 5,
                'limit' => 3,
                'total_items' => $total_items
            );

            /*
            $article_max = $page * $limit;
            $article_min = $article_max - $limit + 1;
            if ($article_max > $total_items) {
                $article_max = $total_items;
            }
            */

            $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
            $paginationLayout = $layoutComponent->pagination(parent::$theme, $options);
        } else {
            $list_apartment_block = '';
            $paginationLayout = '';
            $total_items = 0;
        }

        $this->view->setVars(array(
            'searchBlock' => $searchBlock,
            'blocks' => $block,
            'breadcrumbs' => $breadcrumbs,
            'other_block' => $otherBlock,
            'type_view' => $type_view,
            'arrBlocks' => $blocks,
            'floor_count' => $floor_count,
            'list_apartment_block' => $list_apartment_block,
            'paginationLayout' => $paginationLayout,
            'total_items' => $total_items
        ));

        if (self::$theme == 'mobile') {
            $this->view->pick(parent::$theme . '/block/detail');
        } else {
            if ($type_view == \ITECH\Data\Lib\Constant::TYPE_IMAGE_VIEW) {
                $this->view->pick(parent::$theme . '/block/detail_image_view');
            }
            if ($type_view == \ITECH\Data\Lib\Constant::TYPE_PLAN_VIEW) {
                $this->view->pick(parent::$theme . '/block/detail_plan_view');
            }
            if ($type_view == \ITECH\Data\Lib\Constant::TYPE_BUILDING_VIEW) {
                $this->view->pick(parent::$theme . '/block/detail_building_view');
            }
        }
    }

    public function quickViewAjaxAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id = $this->request->getQuery('id', array('striptags', 'trim', 'int'));
        $url = $this->config->application->api_url . 'block/full-ajax';
        $get = [
            'id' => $id,
            'authorized_token' => $authorizedToken
        ];
        // $url = $url . '?' . http_build_query($get);
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result'])) {
            $block = $r['result'];
        }

        $this->view->setVars(array(
            'block_detail' => $block
        ));
        $this->view->pick(parent::$theme . '/block/quick_view_ajax');
    }
}
