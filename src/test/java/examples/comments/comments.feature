Feature: extended sample karate test script build by DeeperThanBlue Unify.
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com/'

  Scenario: get all comments and then get the first comment by id
    Given path 'comments'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'comments', first.id
    When method get
    Then status 200

  Scenario: create a comment and then get it by id
    * def comment =
      """
      {
        "postId": 1,
        "name": "nadroj noyneb",
        "email": "nadroj@noyneb.com",
        "body": "I really like this post, very interesting."
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/comments'
    And request comment
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id
  