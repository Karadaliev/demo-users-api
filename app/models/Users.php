<?php

use Phalcon\Mvc\Model;

class Users extends Model
{
    public $id;

    public $email;
    public $givenName = '';
    public $familyName = '';
    public $created;

    /**
     * @param string $email
     * @return mixed
     */
    public function getUserByEmail(string $email)
    {
        return $this::findFirst([
            'conditions' => 'email = :email:',
            'bind' => array('email' => filter_var($email, FILTER_SANITIZE_EMAIL))
        ]);
    }

    /**
     * @param int $userId
     * @return mixed
     */
    public function getUserById(int $userId)
    {
        return $this::findFirst([
            'conditions' => 'id = :id:',
            'bind' => array('id' => filter_var($userId, FILTER_SANITIZE_NUMBER_INT))
        ]);
    }

    /**
     * @param array $postData
     * @return int
     */
    public function createUser(array $postData): int
    {
        $newUser = new $this();
        $newUser->email = filter_var($postData['email'], FILTER_SANITIZE_EMAIL);
        $newUser->givenName = filter_var($postData['given_name'], FILTER_SANITIZE_STRING);
        $newUser->familyName = filter_var($postData['family_name'], FILTER_SANITIZE_STRING);
        $newUser->save();
        return $newUser->id;
    }

    /**
     * @param Users $userToEdit
     * @param array $postData
     */
    public function updateUser(Users $userToEdit, array $postData)
    {
        if (isset($postData['email'])) {
            $userToEdit->email = filter_var($postData['email'], FILTER_SANITIZE_EMAIL);
        }
        if (isset($postData['given_name'])) {
            $userToEdit->givenName = filter_var($postData['given_name'], FILTER_SANITIZE_STRING);
        }
        if (isset($postData['family_name'])) {
            $userToEdit->familyName = filter_var($postData['family_name'], FILTER_SANITIZE_STRING);
        }
        $userToEdit->save();
    }

    /**
     * @param int $start
     * @param int $limit
     * @return mixed
     */
    public function listUsers(int $start = 0, int $limit = 0)
    {
        $conditions = [
            'order' => 'created DESC',
            'limit' => [
                'offset' => $start
            ]
        ];
        if ($limit > 0) {
            $conditions['limit']['number'] = $limit;
        }
        return Users::find($conditions);
    }

    /**
     * @param int $userId
     * @return bool
     */
    public function deleteUser(int $userId): bool
    {
        return $this->getUserById($userId)->delete();
    }

    /**
     * truncates the current table
     */
    public function truncate()
    {
        $this->getDi()->getShared('db')->query("truncate table " . $this->getSource());
    }
}