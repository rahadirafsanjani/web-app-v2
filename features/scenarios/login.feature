Feature: is it login yet?
  Everybody need to login for accessing full features in website

  Scenario: successfull login with validated email
    Given user navigate into web-blog-app
    When User access features in web-blog-app will asked for login with their account
    And User logs in through login window by using email as email1
    And password as password1
    When hasnt account yet user must create new account
    And User navigated by system into sign up page
    Then User can create new account in the sign up page
    When User creating new account must asking to validate his email
    And User will confirm his email
    When User was validated email
    Then User must be logen into application
    And login must be successfull