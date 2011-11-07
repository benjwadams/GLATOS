Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I should be signed out

    Scenario: User enters wrong password
      Given I am not logged in
      And a user exists
      When I go to the sign in page
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Invalid email or password."
      And I should be signed out

    Scenario: A public user signs in successfully becuase approval is not required
      Given I am not logged in
      And a user exists
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Signed in successfully"
      And I should be signed in
      When I return next time
      Then I should be already signed in

    Scenario: A non public user (investigator) requires approval before signing in
      Given I am not logged in
      And an unapproved investigator exists
      When I go to the sign in page
      And I sign in as "investigator@glatos.org/please"
      Then I should see "Your account has not been approved"
      And I should be signed out

    Scenario: A non public user (researcher) requires approval before signing in
      Given I am not logged in
      And an unapproved researcher exists
      When I go to the sign in page
      And I sign in as "researcher@glatos.org/please"
      Then I should see "Your account has not been approved"
      And I should be signed out

    Scenario: User signs in successfully with an approved account
      Given I am not logged in
      And an approved user exists
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Signed in successfully"
      And I should be signed in
      When I return next time
      Then I should be already signed in
