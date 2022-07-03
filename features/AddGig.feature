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
    And I select "Sviluppo di siti web" from "user[category]"
    And I check "shopify-developer"
    And I press "Registrati"
    Then I should be on the home page
    And I should see "User Page"


Scenario: Login and Add a gig

    # signup
    Given I am on the Sign Up Page
    When I fill in "user[email]" with "m.carassiti@hotmail.it"
    And I fill in "user[password]" with "123456789"
    And I fill in "user[password_confirmation]" with "123456789"
    And I select "Sviluppo di siti web" from "user[category]"
    And I check "shopify-developer"
    And I press "Registrati"
    Then I should be on the home page
    And I should see "User Page"

    # create a gig
    Given I am on the Create New Gig page
    When I fill in "gig[title]" with "La gig di test da modificare"
    And I fill in "gig[description]" with "La mia descrizione"
    And I fill in "gig[cost]" with "1"
    And I select "Sviluppo di siti web" from "gig[categories]"
    And I check "shopify-developer"
    And I select "BTC" from "gig[currency]"
    And I press "Create Gig"
    Then I should see "La gig di test da modificare"


Scenario: Login and Edit a gig

    # signup
    Given I am on the Sign Up Page
    When I fill in "user[email]" with "m.carassiti@hotmail.it"
    And I fill in "user[password]" with "123456789"
    And I fill in "user[password_confirmation]" with "123456789"
    And I select "Sviluppo di siti web" from "user[category]"
    And I check "shopify-developer"
    And I press "Registrati"
    Then I should be on the home page
    And I should see "User Page"

    # create a gig
    Given I am on the Create New Gig page
    When I fill in "gig[title]" with "La gig di test da modificare"
    And I fill in "gig[description]" with "La mia descrizione"
    And I fill in "gig[cost]" with "1"
    And I select "Sviluppo di siti web" from "gig[categories]"
    And I check "shopify-developer"
    And I select "BTC" from "gig[currency]"
    And I press "Create Gig"
    Then I should see "La gig di test da modificare"
   
    # edit a gig
    Given I am on the Gig page
    And I follow "Dettagli"
    And I follow "Modifica"
    Then I should see "Modifica Gig"
    And I fill in "gig[title]" with "La gig di test modificata"
    And I press "Update Gig"
    Then I should see "La gig di test modificata"