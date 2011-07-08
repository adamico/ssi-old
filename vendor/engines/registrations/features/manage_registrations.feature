@registrations
Feature: Registrations
  In order to have registrations on my website
  As an administrator
  I want to manage registrations

  Background:
    Given I am a logged in refinery user
    And I have no registrations

  @registrations-list @list
  Scenario: Registrations List
   Given I have registrations titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of registrations
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @registrations-valid @valid
  Scenario: Create Valid Registration
    When I go to the list of registrations
    And I follow "Add New Registration"
    And I fill in "Surname" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 registration

  @registrations-invalid @invalid
  Scenario: Create Invalid Registration (without surname)
    When I go to the list of registrations
    And I follow "Add New Registration"
    And I press "Save"
    Then I should see "Surname can't be blank"
    And I should have 0 registrations

  @registrations-edit @edit
  Scenario: Edit Existing Registration
    Given I have registrations titled "A surname"
    When I go to the list of registrations
    And I follow "Edit this registration" within ".actions"
    Then I fill in "Surname" with "A different surname"
    And I press "Save"
    Then I should see "'A different surname' was successfully updated."
    And I should be on the list of registrations
    And I should not see "A surname"

  @registrations-duplicate @duplicate
  Scenario: Create Duplicate Registration
    Given I only have registrations titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of registrations
    And I follow "Add New Registration"
    And I fill in "Surname" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 registrations

  @registrations-delete @delete
  Scenario: Delete Registration
    Given I only have registrations titled UniqueTitleOne
    When I go to the list of registrations
    And I follow "Remove this registration forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 registrations
 