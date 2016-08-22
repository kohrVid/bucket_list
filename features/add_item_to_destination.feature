Feature: Add Item to Destination
  @javascript

  Scenario: A traveller adds a todo item to a destination
    Given they have signed up
      And they have signed in
      And they are on their bucketlist page
      And have added a destination
    When they add a todo item
    Then the todo item should appear alongside the destination on the BucketList page

  @wip
  Scenario: A traveller orders todo items by title
    Given they have signed up
      And they have signed in
      And they are on their bucketlist page
      And have added a destination
    When they order the todo items by title
    Then the list should be orderd by alpha

