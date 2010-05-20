Feature: Manage Posts

  Background:
    Given a valid user record for some_user@email.com

  Scenario: Posts List
    Given I am logged in
    And I have posts titled Money, Teacher in categories Economy, Education
    When I go to the list of posts
    Then I should see "Money"
    And I should see "Teacher"
    And I should see "Economy"
    And I should see "Education"
  
  Scenario: Create Post
    Given I am logged in
    And I am on new post
    When I select "My First Category" from "post[category_id]"
    And I fill in "post[title]" with "The best post"
    And I fill in "post[content]" with "This is my best and favorite post"
    And I fill in "post[tag_list]" with "post, first, test"
    And I press "Create"
    Then I should see "Post created!"
    And I should see "My First Category" within ".title"
    And I should see "The best post" within ".title"
    And I should see "This is my best and favorite post" within ".content"
    And I should see "some_user@email.com" within ".author"
    And I should be on the post page

  Scenario: Edit Post
    Given I am logged in
    And I am on edit post
    When I fill in "post[title]" with "The edit post title"
    And I press "Save"
    Then I should see "Post updated!"
    And I should see "The edit post title" within ".title"
    And I should be on the post page
  
  Scenario: Destroy Post
    Given I am logged in
    And I have 2 posts
    And I am on show post
    Then I should see "Destroy"
    And I should see "Edit"
    When I follow "Destroy"
    Then I should see "Post delete!"
    And I should have 1 posts
    And I should be on the list of posts
  
  Scenario: Permission Edit Post
    Given I am on show post
    Then I should not see "Destroy"
    And I should not see "Edit"
    When I go to edit post
    Then I should see "You must be logged in to access this page"
    



  
