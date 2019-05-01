Feature: Login feature

  @android
  Scenario: As a valid first user I can log into QA app
    Given I'm on the homepage
    Then I enter my "percival@gmail.com" username
    Then I enter my "123456" password
    When I click on SIGN IN OR REGISTER button
    Then I see picture of the house

  @android
  Scenario: As a valid second user I can log into QA app
    Given I'm on the homepage
    Then I enter my "arthur@gmail.com" username
    Then I enter my "98765" password
    When I click on SIGN IN OR REGISTER button
    Then I see picture of the house

  @android
  Scenario: As invalid first user I can log into QA app
    Given I'm on the homepage
    Then I enter my "dfff@gmail.com" username
    Then I enter my "123456" password
    When I click on SIGN IN OR REGISTER button
    Then I see "Account does not exist" message

  @android
  Scenario: As invalid first user I can log into QA app
    Given I'm on the homepage
    Then I enter my "percival@gmail.com" username
    Then I enter my " " password
    When I click on SIGN IN OR REGISTER button
    Then I see "This password is too short" message


