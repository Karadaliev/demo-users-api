<?php

namespace Services;

class Users
{
    // Users model
    private $usersModel = false;
    private $defaultResult = [
        'type' => 'error',
        'message' => 'Unknown result, probably script error!'
    ];

    public function __construct(\Users $usersModel)
    {
        $this->usersModel = $usersModel;
    }

    /**
     * @param array $data
     * @param array $requiredKeys
     * @return bool
     */
    public function validateData(array $data, array $requiredKeys): bool
    {
        $result = false;
        foreach ($requiredKeys as $key) {
            if (isset($data[$key]) && !empty($key)) {
                $result = true;
            } else {
                $result = false;
                break;
            }
        }
        return $result;
    }

    /**
     * @param array $formData
     * @return array
     */
    public function createUser(array $formData): array
    {
        $result = $this->defaultResult;
        // checking if the email exists in our database
        $existingUser = $this->usersModel->getUserByEmail($formData['email']);
        if ($existingUser) {
            // error, there is existing user with this email
            $result['message'] = "There is existing user with the same email address!";
        } else {
            // saving the user
            $userId = $this->usersModel->createUser($formData);
            if ($userId > 0) {
                $result['type'] = "success";
                $result['message'] = "Created new user with ID: " . $userId;
            } else {
                $result['message'] = "Database error, cannot save the user!";
            }
        }
        return $result;
    }

    /**
     * @param string $userEmail
     * @return array
     */
    public function readUser(string $userEmail): array
    {
        $result = $this->defaultResult;
        // trying to find the user
        $userData = $this->usersModel->getUserByEmail($userEmail);
        if ($userData) {
            // we have the user, generating the response
            $result = [
                'type' => 'success',
                'message' => 'User found!',
                'data' => (is_array($userData) ? $userData : $userData->toArray())
            ];
        } else {
            $result['message'] = "User with email '" . $userEmail . "' don't exists in the database!";
        }
        return $result;
    }

    /**
     * @param array $formData
     * @return array
     */
    public function updateUser(array $formData): array
    {
        $result = $this->defaultResult;
        // we have all of the data
        // checking if the user exists in our database
        $userId = filter_var($formData['id'], FILTER_SANITIZE_NUMBER_INT);
        $existingUser = $this->usersModel->getUserById($userId);
        if ($existingUser) {
            // updating the user
            $this->usersModel->updateUser($existingUser, $formData);
            $result['type'] = "success";
            $result['message'] = "Updated existing user with ID: " . $userId;
        } else {
            // error, there is no user with this id
            $result['message'] = "There is NO existing user with ID: " . $userId . "!";
        }
        return $result;
    }

    /**
     * @param int $userId
     * @return array
     */
    public function deleteUser(int $userId): array
    {
        $result = $this->defaultResult;
        // checking if the user exists
        $existingUser = $this->usersModel->getUserById($userId);
        if ($existingUser) {
            // we can delete it
            if ($this->usersModel->deleteUser($userId)) {
                $result['type'] = "success";
                $result['message'] = "Deleted existing user with ID: " . $userId;
            } else {
                $result['message'] = "Database error, cannot delete the user!";;
            }
        } else {
            $result['message'] = "There is NO existing user with ID: " . $userId . "!";
        }
        return $result;
    }
}