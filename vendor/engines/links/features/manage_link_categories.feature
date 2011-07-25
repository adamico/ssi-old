@link_categories
Feature: Link Categories
  In order to have link_categories on my website
  As an administrator
  I want to manage link_categories

  Background:
    Given I am a logged in refinery user
    And I have no link_categories

  @link_categories-list @list
  Scenario: Link Categories List
   Given I have link_categories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of link_categories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @link_categories-valid @valid
  Scenario: Create Valid Link Category
    When I go to the list of link_categories
    And I follow "Add New Link Category"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 link_category

  @link_categories-invalid @invalid
  Scenario: Create Invalid Link Category (without title)
    When I go to the list of link_categories
    And I follow "Add New Link Category"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 link_categories

  @link_categories-edit @edit
  Scenario: Edit Existing Link Category
    Given I have link_categories titled "A title"
    When I go to the list of link_categories
    And I follow "Edit this link_category" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of link_categories
    And I should not see "A title"

  @link_categories-duplicate @duplicate
  Scenario: Create Duplicate Link Category
    Given I only have link_categories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of link_categories
    And I follow "Add New Link Category"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 link_categories

  @link_categories-delete @delete
  Scenario: Delete Link Category
    Given I only have link_categories titled UniqueTitleOne
    When I go to the list of link_categories
    And I follow "Remove this link category forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 link_categories
 