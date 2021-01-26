Feature: extended sample karate test script build by DeeperThanBlue Unify.
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com/'

  Scenario: get all comments and then get the first comment by id
    Given path 'todos'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'todos', first.id
    When method get
    Then status 200

  