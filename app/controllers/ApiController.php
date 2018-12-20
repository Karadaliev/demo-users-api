<?php

use Phalcon\Mvc\Controller;
use Services\Users as UserService;

class ApiController extends Controller
{
    /**
     * Adds user to the table
     * @return mixed
     */
    public function createAction()
    {
        $result = [
            'type' => 'error',
            'message' => 'Missing parameters, this functionality expects a POST array called `user` with `email`, `given_name`, and `family_name` keys!'
        ];

        if ($this->request->hasPost('user')) {
            $formData = $this->request->getPost('user');
            $userService = new UserService(new Users());
            // validating the data
            if ($userService->validateData($formData, ['email', 'given_name', 'family_name'])) {
                // we have all of the data
                $result = $userService->createUser($formData);
            }
        }
        return $this->response->setJsonContent($result);
    }

    /**
     * Reads user from the table
     * @return mixed
     */
    public function readAction()
    {
        $result = [
            'type' => 'error',
            'message' => 'Missing parameters, this functionality expects a POST array with `user_email` key!'
        ];

        if ($this->request->hasPost('user_email')) {
            $userEmail = $this->request->getPost('user_email');
            // validating the data
            if (!empty($userEmail)) {
                $result = (new UserService(new Users()))->readUser($userEmail);
            }
        }

        return $this->response->setJsonContent($result);
    }

    /**
     * Lists users from the table
     * @return mixed
     */
    public function listAction()
    {
        // the default result its just empty select
        $result = [
            0 => [
                "id" => 0,
                "email" => "--- Pick a user ---",
                "givenName" => "",
                "familyName" => "",
                "created" => ""
            ]
        ];
        // none of the options are required
        $formStart = $this->request->hasPost('start') ? filter_var($this->request->getPost('start'),
            FILTER_SANITIZE_NUMBER_INT) : 0;
        $formLimit = $this->request->hasPost('limit') ? filter_var($this->request->getPost('limit'),
            FILTER_SANITIZE_NUMBER_INT) : 0;
        $usersModel = new Users();
        $usersList = $usersModel->listUsers($formStart, $formLimit);
        if ($usersList) {
            $result = $usersList->toArray();
        }
        return $this->response->setJsonContent($result);
    }

    /**
     * Update's users data (given and family name) in the table
     * @return mixed
     */
    public function updateAction()
    {
        $result = [
            'type' => 'error',
            'message' => 'Missing parameters, this functionality expects a POST array called `user` with `id`, `given_name`, and `family_name` keys!'
        ];

        if ($this->request->hasPost('user')) {
            $formData = $this->request->getPost('user');
            $userService = new UserService(new Users());
            // validating the data
            if ($userService->validateData($formData, ['id', 'given_name', 'family_name'])) {
                $userService->updateUser($formData);
            }
        }
        return $this->response->setJsonContent($result);
    }

    /**
     * Delete user from the table
     * @return mixed
     */
    public function deleteAction()
    {
        $result = [
            'type' => 'error',
            'message' => 'Missing parameters, this functionality expects a POST variable with `user_id` key!'
        ];
        if ($this->request->hasPost('user_id')) {
            $userId = filter_var($this->request->getPost('user_id'), FILTER_SANITIZE_NUMBER_INT);
            if ($userId > 0) {
                $result = (new UserService(new Users()))->deleteUser($userId);
            }
        }
        return $this->response->setJsonContent($result);
    }
}