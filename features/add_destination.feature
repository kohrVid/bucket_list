Feature: Add Destination

  Scenario: A traveller adds a destination to their bucket list
    Given they have signed up
      And they have signed in
      And they are on their bucketlist page
    When they add a destination
    Then the destination should appear on the bucketlist

