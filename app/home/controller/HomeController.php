<?php
namespace ITECH\Home\Controller;

class HomeController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        $layoutComponent = new \ITECH\Home\Component\LayoutComponent();
        $searchBlock = $layoutComponent->searchHome(self::$theme);

        $params = array();

        $projectComponent = new \ITECH\Home\Component\ProjectComponent();
        $projectLayout = $projectComponent->home(parent::$theme, $params);

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'home/file-json?file_name=system_config&authorized_token=' . $authorizedToken;

        $cacheName = md5(serialize(array(
            'HomeController',
            'indexAction',
            'Api',
            $url
        )));

        $systemConfig = $this->cache->get($cacheName);
        if (!$systemConfig) {
            $systemConfig = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $systemConfig = $r['result'];
            }

            $this->cache->save($cacheName, $systemConfig);
        }

        // --------- Banner Home
        $url = $this->config->application->api_url . 'media-list?category_id=' . \ITECH\Data\Lib\Constant::CATEGORY_SLIDE_HOME;

        $cacheName = md5(serialize(array(
            'HomeController',
            'indexAction',
            'Api',
            $url
        )));

        $bannerHome = $this->cache->get($cacheName);
        if (!$bannerHome) {
            $bannerHome = array();

            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            if (isset($r['status']) && $r['status'] == 200 && isset($r['result'])) {
                $bannerHome = $r['result'];
            }

            $this->cache->save($cacheName, $bannerHome);
        }
        // Banner Home ---------

        // --------- GET APARTMENT HOME
        $apartmentLayoutComponent = new \ITECH\Home\Component\LayoutComponent();

        $url = $this->config->application->api_url . 'apartment/ceriterial';

        $query = array();
        $query['authorized_token'] = $authorizedToken;
        $query['is_home'] = \ITECH\Data\Lib\Constant::CERITERIAL_APARTMENT_IS_HOME_YES;
        $query['cache'] = 'true';

        $url = $url . '?' . http_build_query($query);

        $cache_name = md5(serialize(array(
            'ApartmentController',
            'rentAction',
            'Api',
            $url
        )));

        $ceriterialApartment = array();
        $response = $this->cache->get($cache_name);
        if (!$response) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url), true);
            $this->cache->save($cache_name, $response);
        }

        if (isset($response['result']) && count($response['result'])) {
            $ceriterialApartment = $response['result'];
        }

        $apartmentBlockLayout = [];
        // $apartmentBlockLayout = $apartmentLayoutComponent->buildBlockApartment($ceriterialApartment, parent::$theme);

        // GET APARTMENT HOME ---------

        $this->view->setVars(array(
            'systemConfig' => $systemConfig,
            'searchBlock' => $searchBlock,
            'bannerHome' => $bannerHome,
            'projectLayout' => $projectLayout,
            'apartmentBlockLayout' => $apartmentBlockLayout
        ));
        $this->view->pick(parent::$theme . '/home/index');
    }

    public function userRegisterAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
            'message' => 'Success.',
            'result' => array()
        );

        $language = $this->session->get('LANGUAGE');
        if (!$language){
            $language = 'vi';
        }

        if ($this->request->isPost()) {
            $firstname = $this->request->getPost('firstname');
            $lastname = $this->request->getPost('lastname');
            $password = $this->request->getPost('password');
            $day = $this->request->getPost('day');
            $month = $this->request->getPost('month');
            $year = $this->request->getPost('year');
            $email = $this->request->getPost('email');
            $province = $this->request->getPost('province');
            $district = $this->request->getPost('district');
            $address = $this->request->getPost('address');
            $job_type= $this->request->getPost('job_type');
            $type_user = $this->request->getPost('type_user');
            $birthday = $year . '-' . $month . '-' . $day;

            $url = $this->config->application->api_url . 'user/register?authorized_token=' . $authorizedToken;
            $post = array(
                'firstname' => $firstname,
                'lastname' => $lastname,
                'password' => $password,
                'birthday' => $birthday,
                'district' => $district,
                'address' => $address,
                'email' => $email,
                'province' => $province,
                'job_type' => $job_type,
                'type_user' => \ITECH\Data\Lib\Constant::USER_TYPE_MEMBER,
                'language' => $language,
                'membership' => '31',
            );

            $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
            if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                $user = $r['result'];

                $url = $this->config->application->api_url .'/option/detail';
                $get = [
                    'key_option' => 'mess_signin_success_vi'
                ];
                $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
                if (isset($r['result']['value'])) {
                    $mess = $r['result']['value'];
                } else {
                    $mess = $r['result']['value'];
                }
                $this->flashSession->success('Đăng ký thành viên thành công.');
                $url_redirect = $this->url->get(array('for' => 'home'));
                $this->response->redirect($url_redirect);

                parent::setUserSession($user);
            } else {
                if (isset($r['message'])) {
                    $this->flashSession->success($r['message']);
                } else {
                    $this->flashSession->success('Lỗi, không thể đăng ký thành viên.');
                }

                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => isset($r['message']) ? $r['message'] : 'Error.',
                    'result' => $r['result']
                );
                $this->view->setVars(array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => isset($r['message']) ? $r['message'] : 'Error.',
                    'result' => json_encode($r['result'])
                ));
            }
        }

        $this->view->pick(parent::$theme . '/home/user_register');
    }

    public function agentRegisterAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $language = $this->session->get('LANGUAGE');
        if (!$language){
            $language = 'vi';
        }

        if ($this->request->isPost()) {
            $firstname = $this->request->getPost('firstname');
            $lastname = $this->request->getPost('lastname');
            $password = $this->request->getPost('password');
            $day = $this->request->getPost('day');
            $month = $this->request->getPost('month');
            $year = $this->request->getPost('year');
            $email = $this->request->getPost('email');
            $province = $this->request->getPost('province');
            $district = $this->request->getPost('district');
            $address = $this->request->getPost('address');
            $job_type = $this->request->getPost('job_type');
            $type_user = $this->request->getPost('type_user');
            $birthday = $year . '-' . $month . '-' . $day;

            $url = $this->config->application->api_url . 'user/register?authorized_token=' . $authorizedToken;
            $post = array(
                'firstname' => $firstname,
                'lastname' => $lastname,
                'password' => $password,
                'birthday' => $birthday,
                'district' => $district,
                'address' => $address,
                'email' => $email,
                'province' => $province,
                'job_type' => $job_type,
                'type_user' => \ITECH\Data\Lib\Constant::USER_TYPE_AGENT,
                'language' => $language,
                'membership' => '21',
            );
            $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
            if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                $user = $r['result'];

                $url = $this->config->application->api_url .'/option/detail';
                $get = [
                    'key_option' => 'mess_signin_success_vi'
                ];
                $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
                if (isset($r['result']['value'])) {
                    $mess = $r['result']['value'];
                } else {
                    $mess = $r['result']['value'];
                }
                $this->flashSession->success('Đăng ký thành viên thành công.');
                parent::setUserSession($user);
                $url_redirect = $this->url->get(array('for' => 'home'));
                $this->response->redirect($url_redirect);
            } else {
                if (isset($r['message'])) {
                    $this->flashSession->success($r['message']);
                } else {
                    $this->flashSession->success('Lỗi, không thể đăng ký thành viên.');
                }

                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => isset($r['message']) ? $r['message'] : 'Error.',
                    'result' => $r['result']
                );
                $this->view->setVars(array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => isset($r['message']) ? $r['message'] : 'Error.',
                    'result' => json_encode($r['result'])
                ));
            }
        }

        $this->view->pick(parent::$theme . '/home/agent_register');
    }

    public function forgotPasswordAction(){
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $language = $this->session->get('LANGUAGE');
        if(!$language) {
            $language = 'vi';
        }
        if ($this->request->isPost()) {
            $validator = new \Phalcon\Validation();

            $validator->add('email', new \Phalcon\Validation\Validator\Email(array(
                'message' => ($language == \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_ENG) ? 'Email invalid' : 'Định dạng e-mail không đúng'
            )));
            $validator->setFilters('email', array('striptags', 'trim'));
            $messages = $validator->validate($this->request->getPost());
            if (count($messages)) {
                $result = array();
                foreach ($messages as $message) {
                    $result[$message->getField()] = $message->getMessage();
                }

                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => ($language == \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_ENG) ? 'Enter your email' : 'Vui lòng nhập email.',
                    'result' => $result
                );
            } else {
                $url = $this->config->application->api_url . 'user/forgot-password';
                $password = \ITECH\Data\Lib\Util::randomPassword(6);
                $get = [
                    'authorized_token' => $authorizedToken,
                    'email' => $validator->getValue('email'),
                    'password' => $password
                ];
                $api = $url . '?' . http_build_query($get);

                $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
                if ($r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                    $mailer = \ITECH\Data\Lib\Mailer::instance(array(
                        'delivery' => $this->config->mailer->delivery,
                        'ssl' => $this->config->mailer->ssl,
                        'port' => $this->config->mailer->port,
                        'host' => $this->config->mailer->host,
                        'username' => $this->config->mailer->username,
                        'password' => $this->config->mailer->password
                    ));
                    $to = $validator->getValue('email');
                    if ($language = 'vi') {
                        $content = 'Mật khẩu mới của bạn là ' . $password;
                    } else {
                        $content = 'New password is ' . $password;
                    }
                    if ($language == 'vi') {
                        if (
                            $mailer->send(
                                array('noreply.jinn.vn@gmail.com' => 'Jinn'),
                                array($to => 'Thành viên'),
                                array(),
                                array(),
                                'Khôi phục mật khẩu',
                                //file_get_contents(ROOT . '/app/home/view/default/email/forgot_password.tpl'),
                                 $content,
                                array()
                            )
                        ){
                            $response = array(
                                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                                'message' => 'Reset mật khẩu thành công, vui lòng check mail để lấy lại mật khẩu',
                                'result' => ''
                            );
                            $this->flashSession->success('Gửi thành công.');
                        } else {
                            $response = array(
                                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                                'message' => 'Gửi mail thất bại, vui lòng thử lại',
                                'result' => ''
                            );
                            $this->flashSession->success('Gửi mail thất bại, vui lòng thử lại.');
                        }
                    } else {
                        if (
                            $mailer->send(
                                array('noreply.jinn.vn@gmail.com' => 'Jinn'),
                                array($to => 'User'),
                                array(),
                                array(),
                                'Reset Password',
                                //file_get_contents(ROOT . '/app/home/view/default/email/forgot_password.tpl'),
                                 $content,
                                array()
                            )
                        ){
                            $response = array(
                                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                                'message' => 'Successful password reset, please check your mail to retrieve your password.',
                                'result' => ''
                            );
                            $this->flashSession->success('Successful.');
                        } else {
                            $response = array(
                                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                                'message' => 'Send mail failed, please try again',
                                'result' => ''
                            );
                            $this->flashSession->success('Send mail failed, please try again.');
                        }
                    }
                } else {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => $r['message'],
                        'result' => ''
                    );
                }
            }
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => ($language == 'vi') ? 'Vui lòng nhập email.' : 'Input Email',
                'result' => ''
            );
        }
        $this->view->setVars(array(
            'status' => $response['status'],
            'message' => isset($response['message']) ? $response['message'] : 'Error.',
            'result' => json_encode($response['result'])
        ));
        if ($response['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $this->view->pick(parent::$theme . '/home/reset_password_success');
        } else {
            $this->view->pick(parent::$theme . '/home/forgot_password');
        }
    }

}
