<?php

class UserServiceTest extends \Codeception\Test\Unit
{
    protected $tester;

    private $usersModel;
    private $userService;

    // setup
    public function _before()
    {
        $this->usersModel = \Codeception\Stub::make('Users', [
            "getUserByEmail" => function ($email) {
                if ($email == "your@email.com") {
                    return [
                        "email" => "your@email.com"
                    ];
                }

                return false;

            },
            "createUser" => function ($data) {
                if (isset($data['given_name']) && isset($data['family_name'])) {
                    return 1;
                }
                return 0;
            },
            "getUserById" => function ($userId) {
                if ($userId > 0) {
                    return true;
                }
                return false;
            },
            "updateUser" => function ($userId) {
                if ($userId > 0) {
                    return true;
                }
                return false;
            },
            "deleteUser" => function ($userId) {
                if ($userId > 0) {
                    return true;
                }
                return false;
            }
        ]);
        $this->userService = new \Services\Users($this->usersModel);
    }

    // tests
    public function testInitializedInstanceCorrect()
    {
        $this->tester->assertInstanceOf(\Services\Users::class, $this->userService);
    }

    public function testValidateDataCorrect()
    {
        $data = [
            "id" => 1,
            "given_name" => "John",
            "family_name" => "Smith"
        ];
        $keys = ["id", "given_name", "family_name"];

        $result = $this->userService->validateData($data, $keys);
        $this->tester->assertEquals($result, true);
    }

    public function testValidateDataInCorrect()
    {
        $data = [
            "id" => 0,
            "given_name" => ""
        ];
        $keys = ["id", "given_name", "family_name"];

        $result = $this->userService->validateData($data, $keys);
        $this->tester->assertEquals($result, false);
    }

    public function testCreateUserCorrect()
    {
        $data = [
            "email" => "new@email.com",
            "given_name" => "John",
            "family_name" => "Smith"
        ];
        $expectedResult = [
            'type' => 'success',
            'message' => 'Created new user with ID: 1'
        ];
        $result = $this->userService->createUser($data);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testCreateUserExisting()
    {
        $expectedResult = [
            'type' => 'error',
            'message' => 'There is existing user with the same email address!'
        ];
        $result = $this->userService->createUser(["email" => "your@email.com"]);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testCreateUserInCorrect()
    {
        $expectedResult = [
            'type' => 'error',
            'message' => 'Database error, cannot save the user!'
        ];
        $result = $this->userService->createUser(["email" => "new@email.com"]);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testReadUserCorrect()
    {
        $expectedResult = [
            'type' => 'success',
            'message' => 'User found!',
            'data' => [
                "email" => "your@email.com"
            ]
        ];
        $result = $this->userService->readUser("your@email.com");
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testReadUserInCorrect()
    {
        $expectedResult = [
            'type' => 'error',
            'message' => 'User with email \'new@email.com\' don\'t exists in the database!'
        ];
        $result = $this->userService->readUser("new@email.com");
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testUpdateUserCorrect()
    {
        $data = [
            "id" => 1,
            "given_name" => "John",
            "family_name" => "Smith"
        ];
        $expectedResult = [
            'type' => 'success',
            'message' => 'Updated existing user with ID: 1'
        ];
        $result = $this->userService->updateUser($data);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testUpdateUserInCorrect()
    {
        $expectedResult = [
            'type' => 'error',
            'message' => 'There is NO existing user with ID: 0!'
        ];
        $result = $this->userService->updateUser(["id" => 0]);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testDeleteUserCorrect()
    {
        $expectedResult = [
            'type' => 'success',
            'message' => 'Deleted existing user with ID: 1'
        ];
        $result = $this->userService->deleteUser(1);
        $this->tester->assertEquals($result, $expectedResult);
    }

    public function testDeleteUserInCorrect()
    {
        $expectedResult = [
            'type' => 'error',
            'message' => 'There is NO existing user with ID: 0!'
        ];
        $result = $this->userService->deleteUser(0);
        $this->tester->assertEquals($result, $expectedResult);
    }
}