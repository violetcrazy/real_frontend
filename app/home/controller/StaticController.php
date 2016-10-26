<?php
namespace ITECH\Home\Controller;

class StaticController extends \ITECH\Home\Controller\BaseController
{
    public function initialize()
    {
        parent::initialize();
    }

    public function buyAction()
    {
        $this->view->pick(parent::$theme . '/static/buy');
    }

    public function rentAction()
    {
        $this->view->pick(parent::$theme . '/static/rent');
    }

    public function userAction()
    {
        $this->view->pick(parent::$theme . '/static/user');
    }

    public function basicInfoAction()
    {
        $this->view->pick(parent::$theme . '/static/basic_info');
    }

    public function savedHomeAction()
    {
        $this->view->pick(parent::$theme . '/static/saved_home');
    }

    public function savedSearchAction()
    {
        $this->view->pick(parent::$theme . '/static/saved_search');
    }

    public function purchasedPropertiesAction()
    {
        $this->view->pick(parent::$theme . '/static/purchased_properties');
    }

    public function MessagesAction()
    {
        $this->view->pick(parent::$theme . '/static/messages');
    }

    public function settingsAction()
    {
        $this->view->pick(parent::$theme . '/static/settings');
    }

}
