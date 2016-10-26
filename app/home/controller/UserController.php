<?php
namespace ITECH\Home\Controller;

class UserController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function userRegisterAction()
    {
        if ($this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }

        $this->view->setVars(array(
            'test' => 'asdf',
        ));

        $this->view->pick(parent::$theme . '/user/user_register');
    }
    
    public function userLoginAction()
    {
        if ($this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }

        $this->view->pick(parent::$theme . '/user/user_login');
    }
    
    public function agentLoginAction()
    {
        if ($this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }

        $this->view->pick(parent::$theme . '/user/agent_login');
    }

    public function userSignUpAjaxAction()
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
                'type_user' => $type_user,
                'language' => $language,
                'membership' => ($type_user == \ITECH\Data\Lib\Constant::USER_TYPE_AGENT) ? '21' : '31',
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
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                    'message' => 'Success.',
                    'result' => array()
                );

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
            }

            goto RETURN_RESPONSE;
        }

        RETURN_RESPONSE:
            return parent::outputJSON($response);
    }

    public function userForgotPasswordAjaxAction(){
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
            'message' => 'Success.',
            'result' => array()
        );
        $language = $this->session->get('LANGUAGE');
        if(!$language) {
            $language = 'vi';
        }
        if ($this->request->isPost()) {
            $validator = new \Phalcon\Validation();

            $validator->add('email', new \Phalcon\Validation\Validator\Email(array(
                'message' => ($language = \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_ENG) ? 'Email invalid' : 'Định dạng e-mail không đúng'
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
                    'message' => ($language = \ITECH\Data\Lib\Constant::TEXT_LANGUAGE_ENG) ? 'Enter your email' : 'Vui lòng nhập email.',
                    'result' => $result
                );
                goto RETURN_RESPONSE;
            } else {
                $url = $this->config->application->api_url . 'user/forgot-password';
                $password = \ITECH\Data\Lib\Util::randomPassword(6);
                $get = [
                    'authorized_token' => $authorizedToken,
                    'email' => $validator->getValue('email'),
                    'password' => $password
                ];
                $api = $url . '?' . http_build_query($get);
                //var_dump($api); die;
                $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
                if (isset($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
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
            //var_dump($response); die;
        }

        RETURN_RESPONSE:
            parent::outputJSON($response);
    }

    public function userLogoutAction()
    {
        $this->session->remove('USER');

        $cookie = $this->cookies->get('USER');
        $cookie->delete();

        return $this->response->redirect(array('for' => 'home'));
    }

    public function profileAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
        ));

        $this->view->pick(parent::$theme . '/user/user_profile');
    }

    public function detailAction()
    {
        $id = $this->dispatcher->getParam('id', array('int'), '');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $id,
            'type' => \ITECH\Data\Lib\Constant::USER_TYPE_AGENT,
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
            'id' => $id
        ));

        $this->view->pick(parent::$theme . '/user/user_detail');
    }

    public function userSignInAjaxAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $response = array(
            'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
            'message' => 'Success.',
            'result' => array()
        );
        
        $language = $this->session->get('LANGUAGE');
        if (!$language){
            $language == 'vi';
        }

        if ($this->request->isPost()) {
            $validator = new \Phalcon\Validation();
            $validator->add('username', new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => ($language == 'vi') ? 'Vui lòng điền username đăng nhập' : 'Enter username'
            )));
            $validator->setFilters('username', array('striptags', 'trim'));

            $validator->add('password', new \Phalcon\Validation\Validator\StringLength(array(
                'max' => 50,
                'messageMaximum' => ($language == 'vi') ? 'Mật khẩu tối đa 50 ký tự.' : 'Password maximum 50 characters.'
            )));
            $validator->add('password', new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => ($language == 'vi') ? 'Yêu cầu nhập mật khẩu.' : 'Enter your password'
            )));

            $messages = $validator->validate($this->request->getPost());
            if (count($messages)) {
                $result = array();
                foreach ($messages as $message) {
                    $result[$message->getField()] = $message->getMessage();
                }

                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => ($language == 'vi') ? 'Vui lòng điền đầy đủ thông tin còn thiếu.' : 'Please fill in the blank',
                    'result' => $result
                );

                goto RETURN_RESPONSE;
            } else {
                $username = $this->request->getPost('username');
                $password = $this->request->getPost('password');
                $userAgent = $this->request->getUserAgent();
                $ip = $this->request->getClientAddress();

                $url = $this->config->application->api_url . 'user/login?authorized_token=' . $authorizedToken;
                $post = array(
                    'username' => $username,
                    'password' => $password,
                    'application' => 'web',
                    'referral_url' => '',
                    'user_agent' => $userAgent,
                    'ip' => $ip,
                    'type' => \ITECH\Data\Lib\Constant::USER_TYPE_AGENT
                );

                $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
                if (isset($r['result']) && count($r['result'])) {
                    $user = $r['result'];
                    parent::setUserSession($user);
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Success.',
                        'result' => array('referral_url' => $this->url->get(array('for' => 'home')))
                    );
                    goto RETURN_RESPONSE;
                }

                if (isset($r['message'])) {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => $r['message']
                    );
                    goto RETURN_RESPONSE;
                }

                $this->logger->log('[HomeController][userLoginAjaxAction]: ' . json_encode($r), \Phalcon\Logger::ERROR);
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Lỗi, không thể đăng nhập.'
                );

            }
        }

        RETURN_RESPONSE:
            return parent::outputJSON($response);
    }

    public function editAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }

        if ($this->request->isPost()) {
            $id = $userSession['id'];
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
            $phone = $this->request->getPost('phone');
            $job_title = $this->request->getPost('job_title');
            $experience = $this->request->getPost('experience');
            $description = $this->request->getPost('description');
            $save_search = $this->request->getPost('save_search');
            $save_home = $this->request->getPost('save_home');
            $purchased_properties = $this->request->getPost('purchased');
            $new_letter = $this->request->getPost('new_letter');
            $birthday = $year . '-' . $month . '-' . $day;
            $url = $this->config->application->api_url . 'user/setting?authorized_token=' . $authorizedToken;
            $post = array(
                'id' => $id,
                'type' => $userSession['type'],
                'firstname' => $firstname,
                'lastname' => $lastname,
                'password' => $password,
                'birthday' => $birthday,
                'address' => $address,
                'email' => $email,
                'id_province' => $province,
                'id_district' => $district,
                'phone' => $phone,
                'job_title' => $job_title,
                'experience' => $experience,
                'description' => $description,
                'save_search' => $save_search,
                'save_home' => $save_home,
                'purchased_properties' => $purchased_properties,
                'new_letter' => $new_letter,
            );
            $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, $post), true);
            if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                $user = $r['result'];
                $this->flashSession->success('Cập nhật thành công.');
                parent::setUserSession($user);

            } else {
                if (isset($r['message'])) {
                    $this->flashSession->success($r['message']);
                } else {
                    $this->flashSession->success('Lỗi, thêm thành viên không thành công.');
                }
            }
        }

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
        if (!$response && empty($response)) {
            $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            $this->cache->save($cacheName, $response);
        }
        $listProvince = $response['result'];
        $this->view->setVars(array(
            'user' => $user,
            'list_province' => $listProvince
        ));

        $this->view->pick(parent::$theme . '/user/user_edit');
    }

    public function purchasedPropertiesAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
        ));
        $this->view->pick(parent::$theme . '/user/user_purchased_properties');
    }

    public function purchasedPropertiesByAgentAction()
    {
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim'), '');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $id,
            'type' => \ITECH\Data\Lib\Constant::USER_TYPE_AGENT,
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
            'id' => $id
        ));
        $this->view->pick(parent::$theme . '/user/user_purchased_properties_by_agent');
    }

    public function saveHomeAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }

        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'key' => \ITECH\Data\Lib\Constant::USER_SAVE_HOME,
            'cache' => 'false'

        ];
        $url = $this->config->application->api_url . 'user/save-home';
        $api = $url . '?' . http_build_query($get);
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $apartment = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
            $apartment = '';
        }
        $this->view->setVars(array(
            'user' => $user,
            'apartment' => $apartment
        ));
        //var_dump($apartment); die;
        $this->view->pick(parent::$theme . '/user/user_save_home');
    }

    public function saveHomeByAgentAction()
    {
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim'), '');
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $id,
            'type' => \ITECH\Data\Lib\Constant::USER_TYPE_AGENT,
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
            'id' => $id
        ));
        $this->view->pick(parent::$theme . '/user/user_save_home_by_agent');
    }

    public function saveSearchAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
            $url = $this->config->application->api_url . 'user/list-save-search';
            $get = [
                'authorized_token' => $authorizedToken,
                'user_id' => $userSession['id'],
                'key' => \ITECH\Data\Lib\Constant::USER_SAVE_SEARCH,

            ];
            $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
            if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
                    $listSaveSearch = $r;
            } else {
                $listSaveSearch = '';
            }

        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }
        $this->view->setVars(array(
            'user' => $user,
            'listSaveSearch' => $listSaveSearch
        ));
        $this->view->pick(parent::$theme . '/user/user_save_search');
    }

    public function messageAction()
    {
        if (!$this->session->has('USER')) {
            $this->response->redirect(array('for' => 'home'));
        }
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->config->application->pagination_limit;
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url = $this->config->application->api_url . 'user/profile';
        $filter = $this->request->getQuery('filter', array('striptags', 'trim'), 'inbox');
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }

        $url = $this->config->application->api_url . 'message/list';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'filter' => $filter,
            'page' => $page,
            'limit' => $limit
        ];
        $api = $url . '?' . http_build_query($get);
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) > 0 && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $listMessage = $r['result'];
        } else {
            $listMessage = '';
        }
        //var_dump($api); die;
        $url = $this->config->application->api_url . 'message/count-by-id';
        
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id']
        ];
        $countMessageInbox = \ITECH\Data\Lib\Util::curlGet($url, $get);
        
        $get = [
            'authorized_token' => $authorizedToken,
            'created_by' => $userSession['id']
        ];
        $countMessageSend = \ITECH\Data\Lib\Util::curlGet($url, $get);

        $get = [
            'authorized_token' => $authorizedToken,
            'status' => \ITECH\Data\Lib\Constant::MESSAGE_STATUS_INACTIVE
        ];
        $countMessageTrash = \ITECH\Data\Lib\Util::curlGet($url, $get);

        $get = [
            'authorized_token' => $authorizedToken,
            'status' => \ITECH\Data\Lib\Constant::MESSAGE_STATUS_REMOVED
        ];
        $countMessageDelete = \ITECH\Data\Lib\Util::curlGet($url, $get);
        $this->view->setVars(array(
            'user' => $user,
            'listMessage' => $listMessage,
            'countMessageInbox' => $countMessageInbox,
            'countMessageSend' => $countMessageSend,
            'countMessageTrash' => $countMessageTrash,
            'countMessageDelete' => $countMessageDelete,
            'filter' => $filter
        ));
        $this->view->pick(parent::$theme . '/user/user_message');
    }

    public function listAgentAction()
    {
        $q = $this->request->getQuery('q', array('striptags', 'trim'), '');
        $filter = $this->request->getQuery('filter', array('striptags', 'trim'), '');
        $page = $this->request->getQuery('page', array('int'), 1);
        $limit = $this->config->application->pagination_limit;
        //$limit = 3;

        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $type = $this->request->getQuery('type', array('striptags', 'trim', 'lower'), \ITECH\Data\Lib\Constant::USER_TYPE_AGENT);
        $membership = $this->request->getQuery('membership', array('striptags', 'trim', 'lower'), 'agent');
        $url = $this->config->application->api_url . 'user/list?authorized_token=' . $authorizedToken . '&type=' . $type . '&membership=' . $membership . '&page=' . $page . '&limit=' . $limit;
        $r = json_decode(\ITECH\Data\Lib\Util::curlPostJson($url, null), true);
        if ($r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && isset($r['result']['items']) > 0) {
            $listAgent =$r['result'];
        } else {
            $this->flashSession->error('Không tìm thấy');
            $listAgent = null;
        }
        $this->view->setVars(array(
                'list_agent' => $listAgent
        ) );
        $this->view->pick(parent::$theme . '/user/user_list_agent');
    }

    public function saveBookmarkAjaxAction()
    {

        if (!$this->session->has('USER')) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id_apartment = $this->request->getQuery('id', array('striptags', 'trim'));
        $url = $this->config->application->api_url . 'user/save-bookmark';
        $get = [
            'authorized_token' => $authorizedToken,
            'id_apartment' => $id_apartment,
            'id_user' => $userSession['id'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                'message' => 'Success.',
                'result' => $r['result']
            );
            goto RETURN_RESPONSE;
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }

        RETURN_RESPONSE:
            return parent::outputJSON($response);
    }

    public function saveSearchAjaxAction()
    {

        if (!$this->session->has('USER')) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $url_search = $this->request->getQuery('url_search', array('striptags', 'trim'));
        $url = $this->config->application->api_url . 'user/save-search';
        $get = [
            'authorized_token' => $authorizedToken,
            'url_search' => $url_search,
            'id_user' => $userSession['id'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                'message' => 'Success.',
                'result' => $r['result']
            );
            goto RETURN_RESPONSE;
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }

        RETURN_RESPONSE:
            return parent::outputJSON($response);
    }

    public function deleteBookmarkAjaxAction()
    {

        if (!$this->session->has('USER')) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }
        $userSession = $this->session->get('USER');
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id_apartment = $this->request->getQuery('id', array('striptags', 'trim'));
        $url = $this->config->application->api_url . 'user/delete-bookmark';
        $get = [
            'authorized_token' => $authorizedToken,
            'id_apartment' => $id_apartment,
            'id_user' => $userSession['id'],
            'cache' => 'false'

        ];
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                'message' => 'Success.',
                'result' => $r['result']
            );
            goto RETURN_RESPONSE;
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Error.',
                'result' => array()
            );
            goto RETURN_RESPONSE;
        }

        RETURN_RESPONSE:
            parent::outputJSON($response);
    }

    public function contactAction()
    {
        $page = $this->request->getQuery('page', array('int', 'trim'), 1);

        $limit = $this->config->application->pagination_limit;
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $userSession = $this->session->get('USER');

        $params = array(
            'user_id' => $userSession['id'],
            'page' => $page,
            'limit' => $limit,
            'authorized_token' => $authorizedToken
        );
        $url = $this->config->application->api_url . 'user/list-contact';
        $response = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $params), true);

        $url = $this->config->application->api_url . 'user/profile';
        $get = [
            'authorized_token' => $authorizedToken,
            'id' => $userSession['id'],
            'type' => $userSession['type'],
            'cache' => 'false'
        ];
        $user = array();
        $r = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if (isset($r['result']) && count($r['result']) && $r['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS) {
            $user = $r['result'];
        } else {
            $this->flashSession->success('Không tìm thấy thành viên này.');
        }

        $url = $this->url->get(array('for'=>'user_contact'));
        $query = array();
        $total_items = $response['total_items'];
        $total_pages = $response['total_pages'];
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

        $this->view->setVars(array(
            'result' => $response,
            'user' => $user,
            'paginationLayout' => $paginationLayout
        ));
        $this->view->pick(parent::$theme . '/user/contact');
    }

    public function addContactAjaxAction()
    {
        $userSession = $this->session->get('USER');
        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $post['user_id'] = $userSession['id'];
            $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

            $url = $this->config->application->api_url . 'user/add-contact?authorized_token=' . $authorizedToken;
            $response = json_decode(\ITECH\Data\Lib\Util::curlPost($url, $post), true);

            parent::outputJSON($response);
        }
    }

    public function deleteContactAjaxAction()
    {
        $userSession = $this->session->get('USER');
        if ($this->request->isPost()) {
            $post = array();
            $customerId  = $this->request->getPost('customer_id', array('int'), "0");

            $post['customer_id'] = $customerId;
            $post['user_id'] = $userSession['id'];

            $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');

            $url = $this->config->application->api_url . 'user/delete-contact?authorized_token=' . $authorizedToken;
            $response = json_decode(\ITECH\Data\Lib\Util::curlPost($url, $post), true);

            parent::outputJSON($response);
        }
    }
}
