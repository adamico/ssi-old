Feature: Registering
  In order to have attenders to schools
  As a visitor
  I want to fill in the registration form

  Background:
    Given I have no registrations

  @registrations-valid @valid
  Scenario: Create Valid Registration with bank or check payment
    When I go to the registration page
    And I fill in "Surname" with "This is a test of the first string field"
    And I press "Submit"
    Then I should see "Since you have chosen to pay by check"
    And I should have 1 registration

  @registrations-invalid @invalid
  Scenario: Create Invalid Registration (without surname)
    When I go to the registration page
    And I press "Submit"
    Then I should see "Surname can't be blank"
    And I should have 0 registrations
