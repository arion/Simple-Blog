Feature: Manage Post Comments

  Background:
    Given a valid user record for some_user@email.com

  Scenario: Destroy Comment
    Given I am logged in
    And I am on show post
    And I have 2 comments
    Then I should see "Destroy" within ".comment .delete_comment"
    And I should see "Confirm" within ".comment .confirm_comment"
    When I follow "Destroy" within ".comment"
    Then I should see "Comment delete!"
    And I should have 1 comment
    And I should be on show post

  Scenario: Confirm Comment
    Given I am logged in
    And I am on show post
    And I have 0 confrim comments
    When I follow "Confirm"
    Then I should see "Comment confirmed!"
    And I should have 1 confirm comment
    And I should be on show post

  Scenario: Create Comment Anonym
    Given I am on show post
    And I have 0 comments
    Then I should see "Title" within ".new_comment label"
    When I fill in "comment[title]" with "Test user"
    And I fill in "comment[comment]" with "This is first test user comment"
    And I press "Create"
    Then I should see "Comment created!"
    And I should see "Test user" within ".comment_author"
    And I should see "This is first test user comment" within ".comment_content"
    And I should be on show post

  Scenario: Create Comment
    Given I am logged in
    And I am on show post
    And I have 0 comments
    Then I should not see "Title" within ".new_comment label"
    And I fill in "comment[comment]" with "This is first test user comment"
    And I press "Create"
    Then I should see "Comment created!"
    And I should see "some_user@email.com" within ".comment_author"
    And I should see "This is first test user comment" within ".comment_content"
    And I should be on show post