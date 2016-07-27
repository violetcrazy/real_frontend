<?php
namespace ITECH\Home\Controller;

class BaseController extends \Phalcon\Mvc\Controller
{
    public static $theme;
    public static $mainView;
    public static $app;
    public static $options;

    public function initialize()
    {
        $this->authorizedToken();
        $detect = new \ITECH\Data\Lib\MobileDetect();

        $device = $this->request->getQuery('device', array('striptags', 'trim', 'lower'), '');
        $language = $this->request->getQuery('language', array('striptags', 'trim', 'lower'), '');

        self::$theme = 'default';
        self::$mainView = 'default/';

        if ($detect->isMobile()) {
            //self::$theme = 'mobile';
            //self::$mainView = 'mobile/';

            self::$theme = 'default';
            self::$mainView = 'default/';
        }

        if ($device != '') {
            switch ($device) {
                case 'desktop':
                    self::$theme = 'default';
                    self::$mainView = 'default/';
                break;

                case 'mobile':
                    self::$theme = 'mobile';
                    self::$mainView = 'mobile/';
                break;
            }

            if (self::$theme != '' && self::$mainView != '') {
                $this->session->set('THEME', self::$theme);
                $this->session->set('MAIN_VIEW', self::$mainView);
            }
        }

        if ($language != '') {
            $this->session->set('LANGUAGE', $language);

            switch ($language) {
                case 'eng':
                    if (self::$theme == 'default') {
                        self::$theme = 'default_eng';
                        self::$mainView = 'default_eng/';
                    } else if (self::$theme == 'mobile') {
                        self::$theme = 'mobile_eng';
                        self::$mainView = 'mobile_eng';
                    }
                break;

                case 'vi':
                    if (self::$theme == 'default_eng') {
                        self::$theme = 'default';
                        self::$mainView = 'default/';
                    } else if (self::$theme == 'mobile_eng') {
                        self::$theme = 'mobile';
                        self::$mainView = 'mobile/';
                    }
                break;
            }

            if (self::$theme != '' && self::$mainView != '') {
                $this->session->set('THEME', self::$theme);
                $this->session->set('MAIN_VIEW', self::$mainView);
            }
        }

        if ($this->session->has('THEME') && $this->session->has('MAIN_VIEW')) {
            self::$theme = $this->session->get('THEME');
            self::$mainView = $this->session->get('MAIN_VIEW');
        }

        if ($this->session->has('USER')) {
            $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
            $userSession = $this->session->get('USER');
            $url = $this->config->application->api_url . 'message/count-by-id';
            $get = [
                'authorized_token' => $authorizedToken,
                'id' => $userSession['id'],
                'read' => 1
            ];
            $countMessage = \ITECH\Data\Lib\Util::curlGet($url, $get);
            $this->view->setVars(array(
                'countMessage' => $countMessage
            ));
        }

        $url = $this->config->application->api_url . 'option/list?cache=true';
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
        $options = array();

        if ($r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $options = $r['result'];
        }
        self::$options = $options;

        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $headerBlock = $layoutComponent->header(self::$theme);
        $footerBlock = $layoutComponent->footer(self::$theme, self::$options);
        $formRegister = $layoutComponent->register(self::$theme);

        if (isset($options['no_image']) && $options['no_image'] != '') {
            $this->config->asset->img_default = $this->config->cdn->dir_upload . $options['no_image']['value'] ;
        }

        $this->view->setVars(array(
            'option' => self::$options,
            'language' => $language,
            'headerBlock' => $headerBlock,
            'footerBlock' => $footerBlock,
            'formRegister' => $formRegister
        ));
        $this->view->setMainView(self::$mainView);
    }

    public function authorizedToken()
    {
        $hasAuthorizedToken = false;
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

        if (!$this->session->has('AUTHORIZED_TOKEN')) {
            if (!$this->cookies->has('AUTHORIZED_TOKEN')) {
                $hasAuthorizedToken = false;
            } else {
                $cookie = $this->cookies->get('AUTHORIZED_TOKEN');
                $authorizedToken = @unserialize($cookie->getValue());

                if ($authorizedToken != '') {
                    $this->setAuthorizedToken($authorizedToken);
                    $hasAuthorizedToken = true;
                } else {
                    $hasAuthorizedToken = false;
                }
            }
        } else {
            $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
            $hasAuthorizedToken = true;
        }

        if (!$hasAuthorizedToken) {
            $url = $this->config->application->api_url . 'authenticate';
            $post = array(
                'application' => \ITECH\Data\Lib\Constant::SESSION_TOKEN_APPLICATION_WEB,
                'secret' => $this->config->application->secret
            );

            $cacheName = md5(serialize(array(
                'BaseController',
                'authorizedToken',
                'api',
                $url
            )));

            $authorizedToken = $this->cache->get($cacheName);
            if (!$authorizedToken) {
                $response = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
                if (isset($response['status']) && $response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($response['result'])) {
                    $authorizedToken = $response['result'];
                    $this->cache->save($cacheName, $authorizedToken, 3600);
                }
            }

            if ($authorizedToken) {
                $this->setAuthorizedToken($authorizedToken);
            }
        }
    }

    public function setAuthorizedToken($token)
    {
        if ($token && $token != '') {
            $this->session->set('AUTHORIZED_TOKEN', $token);
            $this->cookies->set('AUTHORIZED_TOKEN', serialize($token), strtotime('+4 hours'));
        } else {
            $this->session->remove('AUTHORIZED_TOKEN');

            $cookie = $this->cookies->get('AUTHORIZED_TOKEN');
            $cookie->delete();
        }
    }

    public function outputJSON($response)
    {
        $this->view->disable();
        $this->response->setContentType('application/json', 'UTF-8');
        $this->response->setJsonContent($response);
        $this->response->send();
        exit;
    }

    public function uploadImageToLocal($dir, $fileName, $scaleX, $resource)
    {
        $response = array();

        if (is_dir($dir)) {
            if ($fileName == '') {
                $fileName = uniqid() . '_' . time();
            }

            if ($resource && count($resource)) {
                $u = new \ITECH\Data\Lib\Upload($resource);
                $u->allowed = array('image/*');
                $u->forbidden = array('application/*');

                try {
                    if (!$u->uploaded) {
                        $response = array(
                            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                            'message' => 'Lỗi, không thể upload.'
                        );
                    } else {
                        if ($u->file_is_image) {
                            if ($scaleX > 0) {
                                $u->image_resize = true;
                                $u->image_x = $scaleX;
                                $u->image_ratio_y = true;
                            }

                            $u->jpeg_quality = 100;
                            $u->file_new_name_body = $fileName;
                            $u->process($dir);

                            if ($u->processed) {
                                $fileName .= '.' . $u->file_src_name_ext;

                                $response = array(
                                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                                    'message' => 'Upload thành công.',
                                    'result' => $fileName
                                );
                            } else {
                                $response = array(
                                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                                    'message' => 'Lỗi, không thể xử lý hình ảnh.'
                                );
                            }
                        } else {
                            $response = array(
                                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                                'message' => 'Lỗi, không đúng định dạng hình ảnh.'
                            );
                        }

                        $u->clean();
                    }
                } catch (\Phalcon\Exception $e) {
                    $this->logger->log('[BaseController][uploadImageToLocal] ' . $e->getMessage(), \Phalcon\Logger::ERROR);
                    throw new \Phalcon\Exception($e->getMessage());
                }
            }
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Không tìm thấy thư mục hình ảnh.'
            );
        }

        return $response;
    }

    public function deleteImageFromLocal($dir, $fileName)
    {
        $response = array();

        if (is_dir($dir)) {
            $file = $dir . $fileName;

            if (file_exists($file)) {
                @chmod($file, 0777);

                if (@unlink($file)) {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Xóa hình ảnh thành công.'
                    );
                } else {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => 'Lỗi, không thể xóa hình ảnh.'
                    );
                }
            } else {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Không tồn tại hình ảnh.'
                );
            }
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Không tìm thấy thư mục hình ảnh.'
            );
        }

        return $response;
    }

    public function uploadImageToCdn($local_dir, $remote_folder, $fileName)
    {
        $response = array();

        if (is_dir($local_dir)) {
            $file = $local_dir . $fileName;

            if (!file_exists($file)) {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Không tồn tại hình ảnh.'
                );

                return $response;
            }

            $content = file_get_contents($file);

            $url = $this->config->cdn->upload_image_url;
            $post = array(
                'content' => $content,
                'folder' => $remote_folder,
                'filename' => $fileName
            );

            $r = \ITECH\Data\Lib\Util::curlPost($url, $post);
            $r = json_decode($r, true);

            if (!empty($r['status']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                    'message' => 'Upload thành công.'
                );
            } else {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Lỗi, không thể upload.'
                );
            }
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Không tìm thấy thư mục hình ảnh.'
            );
        }

        return $response;
    }

    public function deleteImageFromCdn($remote_folder, $fileName)
    {
        $response = array();

        $url = $this->config->cdn->delete_image_url;
        $get = array(
            'folder' => $remote_folder,
            'filename' => $fileName
        );

        $r = \ITECH\Data\Lib\Util::curlGet($url, $get);
        $r = json_decode($r, true);

        if (!empty($r['status']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                'message' => 'Xóa thành công.'
            );
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Lỗi, không thể xóa.'
            );
        }

        return $response;
    }

    public function setUserSession($user)
    {
        if ($user && is_array($user) && count($user)) {
            if (isset($user['is_verified'])) {
                $session = array(
                    'id' => $user['id'],
                    'name' => $user['name'],
                    'slug' => $user['slug'],
                    'email' => $user['email'],
                    'avatar' => $user['avatar'],
                    'cover' => $user['cover'],
                    'phone' => $user['phone'],
                    'type' => $user['type'],
                    'membership' => $user['membership'],
                    'is_verified' => $user['is_verified']
                );

                $this->session->set('USER', $session);
                $this->cookies->set('USER', serialize($session), strtotime('+4 hours'));
            } else {
                $this->session->remove('USER');

                $cookie = $this->cookies->get('USER');
                $cookie->delete();
            }
        } else {
            $this->session->remove('USER');

            $cookie = $this->cookies->get('USER');
            $cookie->delete();
        }
    }

    public function getDistrictAction()
    {
        $idProvince = $this->request->getQuery('province_id', array('striptags', 'int'), '');
        $url = $this->config->application->api_url . 'location/list';
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $get = [
            'authorized_token' => $authorizedToken
        ];
        $cacheName = md5(serialize([
            'layoutRegister',
            'listProvince'
        ]));
        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            $this->cache->save($cacheName, $response);
        }
        $listProvince = $response['result'];
        foreach ($listProvince as $key => $value) {
            if ($value['id'] == $idProvince) {
                $listDistrict = $value['district'];
            }
        }
        $html = '';
        if (count($listDistrict > 0)) {
            foreach ($listDistrict as $key => $value) {
                $html .= '<li><a href="" data-value="' . $value['id'] .'">' . $value['name'] . '</a></li>';
            }
        }
        echo $html;
        exit();
    }
    
    public function getOptionDistrictAction()
    {
        $idProvince = $this->request->getQuery('province_id', array('striptags', 'int'), '');
        $url = $this->config->application->api_url . 'location/list';
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $get = [
            'authorized_token' => $authorizedToken
        ];
        $cacheName = md5(serialize([
            'layoutRegister',
            'listProvince'
        ]));
        $response = $this->cache->get($cacheName);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            $this->cache->save($cacheName, $response);
        }
        $listProvince = $response['result'];
        foreach ($listProvince as $key => $value) {
            if ($value['id'] == $idProvince) {
                $listDistrict = $value['district'];
            }
        }
        $html = '';
        if (count($listDistrict > 0)) {
            foreach ($listDistrict as $key => $value) {
                $html .= '<option value="' . $value['id'] . '">' . $value['name'] . '</option>';
            }
        }
        echo $html;
        exit();
    }
}