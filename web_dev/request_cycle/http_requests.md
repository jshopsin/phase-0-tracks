# HTTP Requests

** Instructions: ** Research the following questions and record your answers in that file.

* What are some common HTTP status codes?
  * 200 - OK, everything is functioning properly
  * 202 - accepted
  * 301 - moved permanently
  * 302 - found
  * 400 - bad request, request could not be understood by server
  * 401 - unauthorized
  * 402 - payment required
  * 403 - forbidden
  * 404 - not found
  * 405 - method not allowed
  * 408 - request timeout
  * 409 - conflict
  * 500 - internal server error
  * 503 - service unavailable
  * 504 - gateway timeout
  * 505 - HTTP version not supported

* What is the difference between a GET request and a POST request? When might each be used?
  * GET and POST are somewhat opposites of each other.
  * GET - requests a file or data from a specific source
  * POST - submits or sends a file or data to a specific source

* Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
  * An HTTP cookie is a stored piece of data that is sent to and from the browser and the server.
  * Cookies can be extremely useful in HTTP requests because it keeps a record of the user's login information, settings, personalization, preferences, shopping cart items, or other stored data that would be useful to recall when the same person goes to that website again. This data is stored, recorded and can be used for analyzing user's behavior.
  * Tracking cookies can also be used by third-parties to be able to track what a user does on one website and save those preferences for a different website. For example, if you search for specific item in Amazon and then switch over to Facebook, a tracking cookie is used to see what items you have been searching for in Amazon so that those specific items can be advertised to you in Facebook.
  * Cookies can also be used for security to verify that a specific login is accessed from the same browser. If the browser is not recognized, then perhaps the cookies have been cleared on the browser, the cookies have expired, or you are logging in from a different computer / browser.