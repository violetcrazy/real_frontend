<?php
namespace ITECH\Home\Form;

class ContactFurnitureForm extends \Phalcon\Forms\Form {
    public function initialize($model, $controller, $options = array()) {
        if ($model) {}
        if ($options) {}
        
        if ($controller) {}
        
        $email = new \Phalcon\Forms\Element\Text('email');
        $email->addValidators(array(
            new \ITECH\Admin\Form\Validator\UserEmailValidator(array(
                'message' => 'Email không hợp lệ.'
            ))
        ));
        $email->setFilters(array('striptags', 'trim', 'lower'));
        $this->add($email);
        
        $content = new \Phalcon\Forms\Element\Textarea('content');
        $content->addValidators(array(
            new \Phalcon\Validation\Validator\PresenceOf(array(
                'message' => 'Yêu cầu nhập nội dung.'
            ))
        ));
        $content->setFilters(array('striptags', 'trim'));
        $this->add($content);
        
       
    }
}