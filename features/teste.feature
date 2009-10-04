Feature: Testing
In order to value
As a role
I want feature
 
  Scenario: google
    Given I am on google
    When I fill in "q" with "java são paulo curso"
    And I press "Pesquisa Google"
    Then I should see "Caelum"
    
  Scenario: 1up4developers
    Given I am on http://1up4dev.org
    When I follow "Rodrigo Panachi"
    Then I should see "Ruby on Rails"
