Feature: User can signup and add manually a gig and edit a gig

# login
# Given I am on the Sign In Page
# When I fill in "user[email]" with "m.carassiti@hotmail.it"
# And I fill in "user[password]" with "123456789"
# And I press "Log in"
# Then I should be on the home page
# And I should see "Logout"

Scenario: Signup

    Given I am on the Sign Up Page
    When I fill in "user[email]" with "m.carassiti@hotmail.it"
    And I fill in "user[password]" with "123456789"
    And I fill in "user[password_confirmation]" with "123456789"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Logout"


Scenario: Login and Add a gig

    # signup
    Given I am on the Sign Up Page
    When I fill in "user[email]" with "m.carassiti@hotmail.it"
    And I fill in "user[password]" with "123456789"
    And I fill in "user[password_confirmation]" with "123456789"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Logout"

    # create a gig
    Given I am on the Gig page
    When I follow "New Gig"
    Then I should be on the Create New Gig page
    When I fill in "gig[title]" with "La gig di test"
    And I fill in "gig[description]" with "La mia descrizione"
    And I fill in "gig[cost]" with "1"
    And I fill in "gig[skill]" with "python, javascript, rails, ruby, cucumber"
    And I select "BTC" from "gig[currency]"
    And I press "Create Gig"
    Then I should see "La gig di test"


Scenario: Login and Edit a gig

    # signup
    Given I am on the Sign Up Page
    When I fill in "user[email]" with "m.carassiti@hotmail.it"
    And I fill in "user[password]" with "123456789"
    And I fill in "user[password_confirmation]" with "123456789"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Logout"

    # create a gig
    Given I am on the Gig page
    When I follow "New Gig"
    Then I should be on the Create New Gig page
    When I fill in "gig[title]" with "La gig di test da modificare"
    And I fill in "gig[description]" with "La mia descrizione"
    And I fill in "gig[cost]" with "1"
    And I fill in "gig[skill]" with "python, javascript, rails, ruby, cucumber"
    And I select "BTC" from "gig[currency]"
    And I press "Create Gig"
    Then I should see "La gig di test da modificare"
   
    # edit a gig
    Given I am on the Gig page
    And I follow "La gig di test da modificare"
    And I follow "Edit"
    Then I should see "Edit Gig"
    And I fill in "gig[title]" with "La gig di test modificata"
    And I press "Update Gig"
    Then I should see "La gig di test modificata"