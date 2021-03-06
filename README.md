# README

This is an app for extracting data from medical guidelines.  These guidelines are
publically available at [www.guideline.gov](http://www.guideline.gov).

Medical guidelines contain a signifant amount of data
but this app focuses on the recommendations associated with a given guideline.
To browse all guidelines, head [here](http://www.guideline.gov/browse/by-topic.aspx).
For an example of a medical guideline, navigate [here](http://www.guideline.gov/content.aspx?id=34838).

### Data Extraction

This app scrapes content from the HTML documents for each guideline.

However, there is an RSS feed capable of pulling in summary data about each guideline. 
Unfortately, the summary data is mixed in with medical guidelines 
and commentaries. The RSS feed doesn't provide a way to distinguish them, so we're 
forced to inspect the title.  Titles for Guideline Summaries always look like this:

```

"Guideline Summary: A.S.P.E.N. clinical guidelines: nutrition support of adult patients with hyperglycemia. [American Society for Parenteral and Enteral Nutrition]"

```

If you want to grab all the summaries, there's a seed for that
("db/seeds/seed_all_guidelines.") Running this seed could take a while, as 
there are a few thousand RSS items available (Guideline Summaries constituted 
roughly 2000 entries as of June 2016.).


## API Endpoints

The this is a Rails app with an API. The default way to interact with 
MedDataDepot is via
the API. It's not "API only" because Admins will have the ability to interact 
with MedDataDepot in their browser.

Once you've go the server running, you can hit the endpoint like this, via command line.

```
curl -H "accept: application/vnd.api+json" -H "X-API-Version: 1" http://localhost:3000/api/v1/guidelines | python -m json.tool  
```

If you don't specify a version in the header (which is fine since there're 
currently only one version), the app  will default v1 of the API. So the 
following command will also work.

```
curl -H "accept: application/vnd.api+json" http://localhost:3000/api/v1/guidelines | python -m json.tool
```

You can obtain the guidelines for popular conditionons using a filter.  The 
JSONApi spec requires brackets for filters, so when cURLing an endpoint, remember to use
the "-g" flag to turn off URL globbing parser.

```
curl -g  -H "accept: application/vnd.api+json" -H "X-API-Version: 1" http://localhost:3000/api/v1/guidelines?filter[popular]=true | python -m json.tool  
```




Note that this API does not currently require authentication.  It probably will at some
point, but for now I'm keeping things simple.


## Automated tests
This test relies on Rspec for unit tests and Cucumber for integration tests.
Use the following commands to run all tests:

```
bundle exec rspec
bundle exec cucumber
```

## Caveat Emptor

This app is currently under development.  Things may me changing quickly.


##Todo
* Caching
* Throttlling
* Authentication
