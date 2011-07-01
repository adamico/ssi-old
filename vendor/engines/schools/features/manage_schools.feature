@schools
Feature: Schools
  In order to have schools on my website
  As an administrator
  I want to manage schools

  Background:
    Given I am a logged in refinery user
    And I have no schools

  @schools-list @list
  Scenario: Schools List
   Given I have schools titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of schools
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @schools-valid @valid
  Scenario: Create Valid School
    When I go to the list of schools
    And I follow "Add New School"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 school

  @schools-invalid @invalid
  Scenario: Create Invalid School (without title)
    When I go to the list of schools
    And I follow "Add New School"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 schools

  @schools-edit @edit
  Scenario: Edit Existing School
    Given I have schools titled "A title"
    When I go to the list of schools
    And I follow "Edit this school" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of schools
    And I should not see "A title"

  @schools-duplicate @duplicate
  Scenario: Create Duplicate School
    Given I only have schools titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of schools
    And I follow "Add New School"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 schools

  @schools-delete @delete
  Scenario: Delete School
    Given I only have schools titled UniqueTitleOne
    When I go to the list of schools
    And I follow "Remove this school forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 schools
 