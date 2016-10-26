<?php
namespace ITECH\Home\Controller;

class LoadController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function galleryAjaxAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        if ($this->request->isPost()) {
            $albumId = $this->request->getPost('id', array('striptags', 'trim', 'int'));
            $apartmentId = $this->request->getPost('apartment_id', array('striptags', 'trim', 'int'));
            
            $url = $this->config->application->api_url . 'apartment/full';
            $query = array(
                'id' => $apartmentId,
                'authorized_token' => $authorizedToken,
                'cache' => false
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
                $albums = $apartment['albums'];
            }
        }
        
        $this->view->setVars(array(
            'albumId' => $albumId,
            'albums' => $albums,
            'apartment' => $apartment
        ));
        $this->view->pick(parent::$theme . '/load/gallery_ajax');
    }
    
    public function uploadImageAjaxAction()
    {
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
            'message' => 'Success.'
        );

        $typeUpload = $this->request->getQuery('type_upload', array('striptags', 'trim'), '');
        if ($this->request->isPost()) {
            
            $folder = 'avatar';
            $size = (int)940;
            if ($this->request->hasFiles()) {
                $file = $this->request->getUploadedFiles();
                if (isset($file[0]))     {
                    $resource = array(
                        'name' => $file[0]->getName(),
                        'type' => $file[0]->getType(),
                        'tmp_name' => $file[0]->getTempName(),
                        'error' => $file[0]->getError(),
                        'size' => $file[0]->getSize()
                    );
                    list($width, $height, $type, $attr) = getimagesize($file[0]->getTempName());

                    $width = 200;
                    $imageFilename = '';
                    $r = parent::uploadImageToLocal(ROOT . '/web/home/asset/upload/', '', $width, $resource);
                    if (isset($r['status']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                        $imageFilename = $r['result'];
                    }
                    $r = parent::uploadImageToCdn(ROOT . '/web/home/asset/upload/', $folder, $imageFilename);
                    parent::deleteImageFromLocal(ROOT . '/web/home/asset/upload/', $imageFilename);
                    $file_name = $imageFilename;
                    $image_url = $this->config->asset->frontend_url . 'upload/' . $folder . '/' . $file_name;
                    $default_thumbnail_url = $this->config->asset->frontend_url . 'upload/' . $folder . '/thumbnail/' . $file_name;
                    $image = $file_name;
                    $url = $this->config->application->api_url . 'user/upload-avatar?authorized_token=' . $authorizedToken;
                    $post = array(
                        'id' => $userSession['id'],
                        'avatar' => $image_url
                    );
                    $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
                    if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                            'message' => 'Success.',
                            'result' => array(
                                'image_url' => $image_url,
                                'default_thumbnail_url' => $default_thumbnail_url,
                                'image' => $image
                            )
                        );
                        $user = $r['result'];
                        parent::setUserSession($user);

                    } else { 
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                            'message' => 'Error.',
                        );
                    }
                }                
            }
        }

        RETURN_RESPONSE:
            parent::outputJSON($response);
    }


    public function uploadImageCdnAjaxAction()
    {
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
            'message' => 'Method post is required.'
        );

        if ($this->request->isPost()) {

            $folder = 'avatar';
            $size = (int)940;
            if ($this->request->hasFiles()) {
                $file = $this->request->getUploadedFiles();
                if (isset($file[0]))     {
                    $resource = array(
                        'name' => $file[0]->getName(),
                        'type' => $file[0]->getType(),
                        'tmp_name' => $file[0]->getTempName(),
                        'error' => $file[0]->getError(),
                        'size' => $file[0]->getSize()
                    );
                    list($width, $height, $type, $attr) = getimagesize($file[0]->getTempName());

                    $width = 200;
                    $imageFilename = '';
                    $r = parent::uploadImageToLocal(ROOT . '/web/home/asset/upload/', '', $width, $resource);
                    if (isset($r['status']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                        $imageFilename = $r['result'];
                    }

                    $r = parent::uploadImageToCdn(ROOT . '/web/home/asset/upload/', $folder, $imageFilename);
                    parent::deleteImageFromLocal(ROOT . '/web/home/asset/upload/', $imageFilename);

                    $file_name = $imageFilename;
                    $image_url = $this->config->asset->frontend_url . 'upload/' . $folder . '/' . $file_name;
                    $default_thumbnail_url = $this->config->asset->frontend_url . 'upload/' . $folder . '/thumbnail/' . $file_name;

                    if ($r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                            'message' => 'Success.',
                            'result' => array(
                                'image_url' => $image_url,
                                'default_thumbnail_url' => $default_thumbnail_url
                            )
                        );

                    } else {
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                            'message' => 'Error.'
                        );
                    }
                }
            }
        }

        RETURN_RESPONSE:
            parent::outputJSON($response);
    }

    public function ajaxCenterAction()
    {
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
            'message' => 'Error.',
        );

        if ($this->request->isPost()) {
            if ($this->request->isAjax()) {

                $action = $this->request->getPost('action');

                switch($action) {
                    case 'listBlockByProject':
                        $projectId = $this->request->getPost('project_id', array('trim', 'int'), 0);
                        $r = $this->listBlockByProject($projectId);
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                            'message' => 'Success.',
                            'result' => $r['result']
                        );
                        break;

                    case 'listFungshei':
                        $categoryId = $this->request->getPost('category_id', array('trim', 'int'), 0);
                        $type = $this->request->getPost('type', array('trim', 'int'), 0);
                        $r = $this->listFungshei($categoryId, $type);
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                            'message' => 'Success.',
                            'result' => $r['result']
                        );
                        break;

                    case 'fungsheiDetail':
                        $id = $this->request->getPost('id', array('trim', 'int'), 0);
                        $r = $this->fungsheiDetail($id);
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                            'message' => 'Success.',
                            'result' => $r['result']
                        );
                        break;

                    default :
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                            'message' => 'Action in undefined.',
                        );
                }

            } else {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Ajax is required.',
                );
            }
        }

        parent::outputJSON($response);
    }

    function listBlockByProject($projectId = 0)
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'block/list-by-project';
        $params = array(
            'project_id' => $projectId,
            'authorized_token' => $authorizedToken
        );

        return json_decode(\ITECH\Data\Lib\Util::curlGet($url, $params), true);
    }

    function listFungshei($categoryId = 0, $type)
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'article/list';
        $params = array(
            'category_id' => $categoryId,
            'module' => \ITECH\Data\Lib\Constant::ARTICLE_MODULE_FENGSHUI,
            'authorized_token' => $authorizedToken,
            'type' => $type
        );

        return json_decode(\ITECH\Data\Lib\Util::curlGet($url, $params), true);
    }

    function fungsheiDetail($id)
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'article/detail';
        $params = array(
            'id' => $id,
            'authorized_token' => $authorizedToken,
        );

        return json_decode(\ITECH\Data\Lib\Util::curlGet($url, $params), true);
    }
}
