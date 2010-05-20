Feature: Search

  Background:
    Given a posts have valid tags

  Scenario: Search By Category
    Given I go on category number 1
    Then I should see "My First Category"
    And I should see "My First Title"
    Given I go on category number 2
    Then I should not see "My First Category"
    And I should not see "My First Title"

  Scenario: Search By Tag
    Given I go on tag "tag1"
    Then I should see "My First Title"
    Given I go on tag "tag2"
    Then I should not see "My First Title"
  
  Scenario: Search By Query
    Given I am on the root page
    And the Sphinx indexes are updated
    When I fill in "query" with "CSS"
    And I press "Search"
    Then I should see "My Last Title" within ".title"
    And I should see "CSS" within "span.match"