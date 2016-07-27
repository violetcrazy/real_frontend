<?php
namespace ITECH\Home\Controller;

class ContactController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        //$authorizedToken = $this->session->get('AUTHORIZED_TOKEN');
        $language = $this->session->get('LANGUAGE');
        if ($this->request->isPost()) {
            $validator = new \Phalcon\Validation();

            $validator->add('name', new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => ($language == 'vi') ? 'Vui lòng nhập họ tên.' : 'Please input full name'
            )));
            $validator->setFilters('name', array('striptags', 'trim'));

            $validator->add('email', new \Phalcon\Validation\Validator\Email(array(
                'message' => ($language == 'vi') ? 'Email không hợp lệ.' : 'Invalid email'
            )));
            $validator->setFilters('email', array('striptags', 'trim', 'lower'));

            $validator->add('title', new \Phalcon\Validation\Validator\StringLength(array(
                'min' => 3,
                'messageMinimum' => ($language == 'vi') ? 'Tiêu đề phải lớn hơn 3 ký tự.' : 'Title must be greater than 3 characters'
            )));
            $validator->setFilters('title', array('striptags', 'trim'));

            $validator->add('content', new \Phalcon\Validation\Validator\StringLength(array(
                'min' => 3,
                'messageMinimum' => ($language == 'vi') ? 'Nội dung phải lớn hơn 3 ký tự.' : 'Content must be greater than 3 characters'
            )));
            $validator->setFilters('content', array('striptags', 'trim'));

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
                $post = [
                    'name' => $validator->getValue('name'),
                    'email' => $validator->getValue('email'),
                    'title' => $validator->getValue('title'),
                    'content' => $validator->getValue('content'),
                ];
            } else {
                $mailer = \ITECH\Data\Lib\Mailer::instance(array(
                    'delivery' => $this->config->mailer->delivery,
                    'ssl' => $this->config->mailer->ssl,
                    'port' => $this->config->mailer->port,
                    'host' => $this->config->mailer->host,
                    'username' => $this->config->mailer->username,
                    'password' => $this->config->mailer->password
                ));
                $to = $validator->getValue('email');
                $content = $validator->getValue('content');

                $send = $mailer->send(
                    array('noreply.jinn.vn@gmail.com' => 'Jinn'),
                    array($to => 'Thành viên'),
                    array(),
                    array(),
                    $validator->getValue('title'),
                    //file_get_contents(ROOT . '/app/home/view/default/email/forgot_password.tpl'),
                    $content,
                    array()
                );

                if ($send){
                    $this->flashSession->success('Gửi thành công.');

                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Bạn đã gửi email thành công. Cám ơn bạn đã liên hệ với Jinn',
                        'result' => ''
                    );
                    $post = array();
                } else {
                    $this->flashSession->success('Gửi email không thành công, vui lòng thử lại.');

                    $response = array(
                        'status' => \ITECH\Data\Lib\Constant::STATUS_CODE_SUCCESS,
                        'message' => 'Gửi email không thành công, vui lòng thử lại.',
                        'result' => ''
                    );

                    $post = [
                        'name' => $validator->getValue('name'),
                        'email' => $validator->getValue('email'),
                        'title' => $validator->getValue('title'),
                        'content' => $validator->getValue('content'),
                    ];
                }
            }
        } else {
            $response = array();
            $post = array();
        }

        $this->view->setVars(array(
            'response' => $response,
            'post' => $post
        ));
        $this->view->pick(parent::$theme . '/contact/index');
    }
}