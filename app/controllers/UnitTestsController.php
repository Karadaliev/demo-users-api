<?php

use Phalcon\Mvc\Controller;

class UnitTestsController extends Controller
{
    // Simple page showing the unit test coverage
    public function indexAction()
    {
        $this->view->coveragePath = "/app/tests/_output/coverage/Users.php.html";
        $this->view->coverageHeight = 800;
    }
}