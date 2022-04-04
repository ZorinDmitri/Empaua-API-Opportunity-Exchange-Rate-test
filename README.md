# Empaua-API-Opportunity-Exchange-Rate-test
Practical Exam

Objectives
This exam is intended to help us evaluate some of the following items:
● Your knowledge of Apex;
● Your ability to write performant code;
● Your ability to write code that is readable by others;
● How you use the Salesforce platform's features with your solution.
Introduction
We have set up a virtual web server in a free Heroku instance that implements a simple
currency exchange API mockup. This API listens for POST events in the /v1/exchange
endpoint only.
This endpoint accepts two currency exchange names in the three-character ISO format, such as
"USD", "GBP" or "EUR". The way a request looks like is like this:
GET https://blooming-earth-14649.herokuapp.com/v1/exchange/usd/gbb
For your convenience, you may pass a query parameter called "seed" to the service, which
should be an integer. This can be used for testing purposes. It will make the exchange rate
returned to be the same based on the seed to Python's random.seed method implementation.
The app does not return real currency exchange values.

The response from the server is a JSON object that contains the following attributes: data,
seed and status. The first is another object with other three attributes, called
currency_from, currency_to and rate. The rate attribute is the exchange rate value and
the other two hold the ISO code for the two currencies passed on the URL. The second attribute
returns the seed used for that request, and the last attribute returns "OK" if the request was
successful.
To access the endpoint you should use a token in the Access-Token header, the token is the
following string (otherwise you'll get a 401 Unauthorised message):
5d3df5bc3c8faf40bb7fcc7ee89758d14ff2726e4aa201c032afed6a5758278c8100ce
e5f9f43d855f51995ca33853a71d5a698eb86c268e8c10b9b50f6dd1d2

Challenge
Implement an automation within Salesforce that accesses that API, at that exact endpoint, and
returns the exchange rate between two given currencies. In Salesforce this automation should
update a custom field on the opportunity object once its CurrencyIsoCode is modified.
Considerations
1. The insert event is also important, not the update. On insertion technically you are
modifying the value from null to a currency ISO value (such as the 'USD').
2. The opportunity record is created with the org's currency by default. If you have enabled
Multiple Currencies and the standard currency is the USD, then the opportunity record
will likely be created with that currency. But do consider the scenario where the end user
might change the currency (say you are selling to some company in Japan, then the
opportunity currency will be the JPY instead on insert).
Guidelines
1. You may only create one field on the opportunity.
2. That field should be labelled "Last Exchange Rate" and its API name should be
"LastExchangeRate".

3. You should write unit tests for this scenario.
4. You can run this in your own developer edition org or scratch org.
