<?php
namespace ITECH\Home\Controller;

class MessageController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {

    }

    public function sendAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $language = $this->session->get('LANGUAGE');
        if(!$language) {
            $language = 'vi';
        }
        if ($this->request->isPost()) {
            $id = $this->request->getPost('id');
            $name = $this->request->getPost('name');
            $phone = $this->request->getPost('phone');
            $email = $this->request->getPost('email');
            $content = $this->request->getPost('content');
            $created_by = $this->request->getPost('created_by');
            $post = [
                'name' => $name,
                'phone' => $phone,
                'email' => $email,
                'content' => $content,
                'created_by' => $created_by,
                'id' => $id,
                'type' => 2,
                'status' => 1,
                'language' => $language
            ];

            $url = $this->config->application->api_url . 'message/send?authorized_token=' . $authorizedToken;
            $result = \ITECH\Data\Lib\Util::curlPost($url, $post);
            echo $result;
        }
    }
    
    public function sendMailAction()
    {
        if ($this->request->isPost()) {
            $id = $this->request->getPost('id');
            $name = $this->request->getPost('name');
            $phone = $this->request->getPost('phone');
            $email = $this->request->getPost('email');
            $email_to = $this->request->getPost('email-to');
            $language = $this->request->getPost('language');
            $content = '<p>User : ' . $name . '</p></br>'; 
            $content .= '<p>Phone : ' . $phone . '</p></br>'; 
            $content .= '<p>Email : ' . $email . '</p></br>'; 
            $content .= '<p>Content : </p>  </br>' . $this->request->getPost('content');
           
            $mailer = \ITECH\Data\Lib\Mailer::instance(array(
                'delivery' => $this->config->mailer->delivery,
                'ssl' => $this->config->mailer->ssl,
                'port' => $this->config->mailer->port,
                'host' => $this->config->mailer->host,
                'username' => $this->config->mailer->username,
                'password' => $this->config->mailer->password,
            ));

            if ($language == 'vi') {
                if (
                    $mailer->send(
                        array('noreply.jinn.vn@gmail.com' => 'Jinn'),
                        array($email_to => 'Liên hệ nhà thiết kế'),
                        array(),
                        array(),
                        'Liên hệ nhà thiết kế',
                        file_get_contents(ROOT . '/app/home/view/default/email/send_mail_forniture.tpl'),
                        //$content,
                        array($email_to => array(
                                '{content}' => $content
                            )
                        )
                    )
                ){
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Gửi email thành công.',
                        'result' => ''
                    );
                    $this->flashSession->success('Gửi email thành công.');
                } else {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => 'Gửi email thất bại, vui lòng thử lại',
                        'result' => ''
                    );
                    $this->flashSession->success('Gửi email thất bại, vui lòng thử lại.');
                }
            } else {
                if (
                    $mailer->send(
                        array('noreply.jinn.vn@gmail.com' => 'Jinn'),
                        array($email_to => 'User'),
                        array(),
                        array(),
                        'User contact',
                        file_get_contents(ROOT . '/app/home/view/default/email/send_mail_forniture.tpl'),
                        //$content,
                        array($email_to => array(
                                '{content}' => $content
                            )
                        )
                    )
                ){
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Send mail successful.',
                        'result' => ''
                    );
                    $this->flashSession->success('Send mail successful.');
                } else {
                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                        'message' => 'Send mail failed, please try again',
                        'result' => ''
                    );
                    $this->flashSession->success('Send mail failed, please try again.');
                }
            }
            parent::outputJSON($response);
        }
    }

    public function detailAction()
    {
        $authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $id = $this->dispatcher->getParam('id', array('striptags', 'trim'), '');
        $filter = $this->request->getQuery('filter', array('striptags', 'trim'));
        $url = $this->config->application->api_url . 'user/profile';
        $userSession = $this->session->get('USER');

        $listMessage = array();

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
            'id' => $id,
            'id_user' => $userSession['id'],
            'filter' => $filter
        ];
        $url = $this->config->application->api_url . 'message/detail';
        $result = json_decode(\ITECH\Data\Lib\Util::curlGet($url, $get), true);
        if ($result['status'] == \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS && count($result['result']) > 0) {
            $message = $result['result'];
        }

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
            'filter' => $filter,
            'message' => $message,
            'listMessage' => $listMessage,
            'countMessageInbox' => $countMessageInbox,
            'countMessageSend' => $countMessageSend,
            'countMessageTrash' => $countMessageTrash,
            'countMessageDelete' => $countMessageDelete,
            'user' => $user
        ) );
        $this->view->pick(parent::$theme . '/message/message_detail');
    }

    public function sendMailContactCustomerAction()
    {
        if ($this->request->isPost()) {

            $title = $this->request->getPost('title', array('striptags', 'trim'), 'Liên hệ từ đại lý JINN.VN');
            $content = $this->request->getPost('content', array('striptags', 'trim'), '');
            $email_to = $this->request->getPost('email', array('striptags', 'trim'), '');

            $mailer = \ITECH\Data\Lib\Mailer::instance(array(
                'delivery' => $this->config->mailer->delivery,
                'ssl' => $this->config->mailer->ssl,
                'port' => $this->config->mailer->port,
                'host' => $this->config->mailer->host,
                'username' => $this->config->mailer->username,
                'password' => $this->config->mailer->password,
            ));


            if (
                $mailer->send(
                    array($this->config->mailer->username => $title),
                    array($email_to => $title),
                    array(),
                    array(),
                    $title,
                    file_get_contents(ROOT . '/app/home/view/default/email/contact_customer.tpl'),
                    array($email_to => array(
                            '{content}' => $content
                        )
                    )
                )
            ){
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                    'message' => 'Gửi email thành công.',
                    'result' => ''
                );
            } else {
                $response = array(
                    'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                    'message' => 'Gửi email thất bại, vui lòng thử lại',
                    'result' => ''
                );
            }
            parent::outputJSON($response);
        } else {
            $response = array(
                'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_ERROR,
                'message' => 'Method post is required.',
                'result' => ''
            );
            parent::outputJSON($response);
        }
    }
}