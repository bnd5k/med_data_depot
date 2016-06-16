Feature: Guidelines
  As an consumer of medical data
  I want data to be readily available
  So that doctors can access it easily

  Scenario: User retrieves a list of guidelines
    Given the system contains the following guidelines:
      | title                |
      | Smurfs are healthy   |
      | Cats are healthy     |
      | Unicorns are healthy |

    When the client requests a list of guidelines
    Then the response contains three guidelines
    Then one guideline has a the a "title" attributes of "Smurfs are healthy" 
    Then one guideline has a the a "title" attributes of "Cats are healthy" 
    Then one guideline has a the a "title" attributes of "Unicorns are healthy" 

  Scenario: User retrieves a guideline
    Given the system contains the following guidelines:
      | url                                                  |  title       | recommendation     | condition |
      | http://www.guideline.gov/content.aspx?f=rss&id=38490 | Smurf health | <p> Eat Smurf </p> | Smurfitis |
    When the client requestes the guideline containing the URL "http://www.guideline.gov/content.aspx?f=rss&id=38490" 
    Then the response contains one guideline
    Then one guideline has the following attributes: 
      | attribute 	    | type        | value  					                              |
      | url	  	        | String      | http://www.guideline.gov/content.aspx?f=rss&id=38490  |
      | title	  	    | String      | Smurf health 		            		              |
      | recommendation	| String      | <p> Eat Smurf </p>			      	                  |
      | condition	  	| String      | Smurfitis 				                              |
      | popular	        | FalseClass  | false 			                                      |
 
  Scenario: Importing a guideline
    Given an incomplete guideline
    When I import the recommendation
    Then the guideline contains data for the recommendation
