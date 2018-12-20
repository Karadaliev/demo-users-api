<?php

use Phalcon\Mvc\Controller;

class UtilitiesController extends Controller
{
    // Info page for all available utilities
    public function indexAction()
    {

    }

    // Clears `users` table
    public function usersClearAction()
    {
        $usersModel = new Users();
        $usersModel->truncate();
        $this->flash->success("We successfully cleared the users data!");
        $this->response->redirect('/utilities');
    }
}