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

  @registrations-delete @delete
  Scenario: Delete Registration
    Given I only have registrations titled UniqueTitleOne
    When I go to the list of registrations
    And I follow "Remove this registration forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 registrations
 
