Feature: Authentication

  Background:
    Given a valid user record for some_user@email.com

  Scenario: Check Logging In Links
    Given I am on the root page
    Then I should see "Loggin In"
    And I should see "Sign Up"

  Scenario: Signing Up And Activate
    Given I am on new user
    When I fill in "user[email]" with "test_user@email.com"
    And I fill in "user[password]" with "password"
    And I fill in "user[password_confirmation]" with "password"
    And I press "Sign Up"
    Then I should see "Your account has been created. Please check your e-mail for your account activation instructions!"
    And I should be on the root page
    When I go on activate page
    And I should see "Activate"
    And I press "Activate"
    Then I should see "Account activate!"
    And I should be on the root page  

	Scenario: Login
  	When I go to the login page
  	And I fill in "user_session[email]" with "some_user@email.com"
    And I fill in "user_session[password]" with "password"
		And I press "Login"
		Then I should see "Logged in successfully"
    And I should be on the root page
    And I should see "Hellow some_user@email.com"
    And I should see "Exit"

	Scenario: Login with invalid email
    When I go to the login page
    And I fill in the following:
      |Email|some_user_incorrect@email.com|
      |Password|test|
    And I press "Login"
    Then I should see "Email is not valid"

	Scenario: Login with invalid password
		When I go to the login page
		And I fill in the following:
		  |Email|some_user@email.com|
		  |Password|just_wrong|
		And I press "Login"
		Then I should see "Password is not valid"
