Feature: Create Post

  As a user
  I want to create a post
  So that everyone can read it

  Scenario: creating a blog post
    Given There is a simple blog form
    When I create a blog post
    Then I should see "this is title" in the post title,
    And I should see "this is body" in the post body.