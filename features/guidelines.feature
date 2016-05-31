Feature: Guidelines
  As an consumer of medical data
  I want data to be readily available
  So that doctors can access it easily

  Scenario: User retrieves a list of guidelines
    Given the system contains the following guidelines:
      | url                                                  |  title               | recommendation            |
      | http://www.guideline.gov/content.aspx?f=rss&id=38490 | Smurfs are healthy   | <p> Eat More Smurf</p>    |
      | http://www.guideline.gov/content.aspx?f=rss&id=38491 | Cats are healthy     | <p> Eat More cats</p>     |
      | http://www.guideline.gov/content.aspx?f=rss&id=38492 | Unicorns are healthy | <p> Eat More unicorns</p> |

    When the client requests a list of guidelines
    Then the response contains three guidelines
    Then one guideline has the following attributes: 
      | attribute 	    | type   | value  					                            |
      | url	  	        | String | http://www.guideline.gov/content.aspx?f=rss&id=38490 |
      | title	  	    | String | Smurfs are healthy   				                |
      | recommendation	| String | <p> Eat More Smurf</p> 				                |

    Then one guideline has the following attributes: 
      | attribute 	| type   | value  					                                |
      | url	  	| String | http://www.guideline.gov/content.aspx?f=rss&id=38491         |
      | title	  	| String | Cats are healthy   				                        |
      | recommendation	| String | <p> Eat More cats</p> 				                |

    Then one guideline has the following attributes: 
      | attribute 	    | type   | value  					                            |
      | url	  	        | String | http://www.guideline.gov/content.aspx?f=rss&id=38492 |
      | title	  	    | String | Unicorns are healthy   				                |
      | recommendation	| String | <p> Eat More unicorns</p> 				            |

  Scenario: User retrieves a guideline
    Given the system contains the following guidelines:
      | url                                                  |  title               | recommendation            |
      | http://www.guideline.gov/content.aspx?f=rss&id=38490 | Smurfs are healthy   | <p> Eat More Smurf</p>    |
    When the client requestes the guideline containing the URL "http://www.guideline.gov/content.aspx?f=rss&id=38490" 
    Then the response contains one guideline
    Then one guideline has the following attributes: 
      | attribute 	    | type   | value  					                            |
      | url	  	        | String | http://www.guideline.gov/content.aspx?f=rss&id=38490 |
      | title	  	    | String | Smurfs are healthy   				                |
      | recommendation	| String | <p> Eat More Smurf</p>				                |


  Scenario: Importing a guideline
    Given an incomplete guideline
    When I import the recommendation
    Then the guideline contains data for the recommendation
