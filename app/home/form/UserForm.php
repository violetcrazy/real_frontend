<?php
namespace ITECH\Home\Form;

class UserForm extends \Phalcon\Forms\Form
{
    public function initialize($model, $options)
    {
        if ($model) {}
        if ($options) {}

        $firstname = new \Phalcon\Forms\Element\Text('firstname');
        $firstname->addValidators(array(
            new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => 'Yêu cầu nhập tên đăng nhập.'
            )),
            new \Phalcon\Validation\Validator\StringLength(array(
                'min' => 2,
                'messageMinimum' => 'Tên đăng nhập phải lớn hơn hoặc bằng 5 ký tự.'
            )),
            new \ITECH\Admin\Form\Validator\UserName(array(
                'message' => 'Tên đăng nhập không hợp lệ.'
            ))
        ));
        $firstname->setFilters(array('striptags', 'trim', 'lower'));
        $this->add($firstname);

        if (isset($options['edit'])) {
            $new_password = new \Phalcon\Forms\Element\Text('new_password');
            $this->add($new_password);
        } else {
            $password = new \Phalcon\Forms\Element\Text('password');
            $password->addValidators(array(
                new \Phalcon\Validation\Validator\PresenceOf(array(
                    'message' => 'Yêu cầu nhập mật khẩu.'
                ))
            ));
            $this->add($password);
        }

        $lastname = new \Phalcon\Forms\Element\Text('lastname');
        $lastname->addValidators(array(
            new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => 'Yêu cầu nhập họ tên.'
            ))
        ));
        $lastname->setFilters(array('striptags', 'trim'));
        $this->add($lastname);

        $email = new \Phalcon\Forms\Element\Text('email');
        $email->addValidators(array(
            new \ITECH\Admin\Form\Validator\UserEmail(array(
                'message' => 'Email không hợp lệ.'
            ))
        ));
        $email->setFilters(array('striptags', 'trim', 'lower'));
        $this->add($email);

        $district = new \Phalcon\Forms\Element\Select('membership', \ITECH\Data\Lib\Constant::getUserMembership());
        $this->add($membership);

        $status = new \Phalcon\Forms\Element\Select('status', \ITECH\Data\Lib\Constant::getUserStatus());
        $this->add($status);

        $logined_at = new \Phalcon\Forms\Element\Text('logined_at');
        $logined_at->setFilters(array('striptags', 'trim', 'lower'));
        $this->add($logined_at);
    }
}
