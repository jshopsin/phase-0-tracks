# Study Plan - JQuery

* Start with a video learning tool - Code School video
* Review Jon Duckett's "JavaScript & JQuery" book for section on JQuery
* Look for a cheat sheet through google
* Look for another source on google to learn from (W School, Stack Overflow, etc.)

* Use pomodoro timer for 30 minute increments
  * 20 minutes - Code School video
  * 10 minutes - practice concepts learned
  * 5 minute break
  * 20 minutes - review Chapter 7 - JQuery by Jon Duckett
  * 10 minutes - practice concepts learned
  * 5 minute break
  * 20 minute - continue to review Chapter 7 - JQuery by Jon Duckett
  * 10 minutes - practice concepts learned
  * 5 minute break
  * 5 minutes - look for cheat sheet on google
  * 15 minutes - search for another resource to learn from and read any articles or forum comments to learn more
  * 10 minutes - practice concepts learned
  * 5 minute break
  * 30 minutes - Release 2: Make a Thing
  * 5 minute break
  * 15 minutes - complete Release 2: Make a Thing

* The reason for using a pomodoro timer is to keep myself focused for 30 minute increments with breaks to allow the information I am learning to have time to steep in my brain without overloading myself. This will also help to keep me from going down the rabbit hole and accidently spending more than 2 hours studying.
* I want to start with a short video introduction because I know that I am a visual learner. This will give me the basics before diving deeper and learning from different sources.
* I have learned a lot from Jon Duckett's books so far, so I know this will be another good resource for me.
* I would like to also find an additional resource to learn more from via google along with a helpful cheat sheet that I can call upon for reference.
* I think it will work better for me to interweave practicing topics I'm learning amidst studying, rather than studying for 1.5 hours and practicing for 30 minutes at the end. This way I can see if there are areas that I'm struggling with so I can spend time focusing on that instead of moving on to a different topic.


# What is jQuery:
* a library for JavaScript that helps to:
  * find elements in an HTML document
  * change HTML content
  * listen to what a user does and react accordingly
  * animate content on the page
  * talk over the network to fetch new content
* each web browser has different DOM interfaces, jQuery is used to interact/communicate with all modern web browsers so that the code only has to be written once

* jQuery Selectors:
  * `jQuery(document)` OR `$(document)`
  * `$('h1')`, `$('p')`
  * `$('h1').text()` => text that is in the element
  * `$('h1').text('hello') => hello`
  * `$('#id')`
  * `$('.class')`
  * descendent selector - `$('#class li')`
  * child selector - `$('#class > li')`
  * multiple selectors - `$('#class, .id')`
  * psuedo-selector
    * `$('.id li:first')`
    * `$('.id li:last')`
    * `$('.id li:odd')`
    * `$('.id li:even')`

* Traversing the DOM
  * `$('li').last()`
  * `$('li').first().next().prev()`
  * `$('li').first().parent()`
  * `$('#id').children('li')`

* It is important that the jQuery selections only occur once the DOM has been fully loaded, or it will not be found
  * `$(document).ready(function() { //code })`

* Manipulating the DOM
  * `(<elementLocation>).append(<element>)`
  * `(<elementLocation>).prepend(<element>)`
  * `(<elementLocation>).after(<element>)`
  * `(<elementLocation>).before(<element>)`
  * `(<element>).appendTo(<elementLocation>)`
  * `(<element>).prependTo(<elementLocation>)`
  * `(<element>).insertBefore(<elementLocation>)`
  * `(<element>).insertAfter(<elementLocation>)`
  * `(<element>).remove()`

* jQuery Object Methods
  * `.text(<element>)`
  * `.val(<element>)`
  * `.on(<event>, <event handler(function)>)`
    * `$('button').on('click', function() { } )`
  * `.data(<name>)`
  * `.data(<name>, <value>)`
  * `.hide(<element>)`
  * `.show(<element>)`
  * `.fadeIn(<element>)`
  * `.animate(<element>)`
  * `.delay(<element>)`

* Example:
  ```javacript
  $(document).ready(function() {
    $('button').on('click', function {
      var price = $(<p>From $399.99</p>);
      $('.vacation').append(price);
      $('button').remove();
    });
  });
  ```
    * this would show the price and remove the button when clicked

  * Refactor to do only when the button is clicked and no other buttons should change:
  ```javacript
  $(document).ready(function() {
    $('button').on('click', function {
      var price = $(<p>From $399.99</p>);
      $('.vacation').append(price);
      $(this).remove();
    });
  });
  ```

  * Refactor so that this still functions if the DOM changes:
  ```javacript
  $(document).ready(function() {
    $('button').on('click', function {
      var price = $(<p>From $399.99</p>);
      $(this).closest('.vacation').append(price);
      $(this).remove();
    });
  });
  ```
    * this will find the closest ancestor with the class='vacation'

  * Refactor using event delegation:
  ```javacript
  $(document).ready(function() {
    $('.vacation').on('click', 'button', function {
      var price = $(<p>From $399.99</p>);
      $(this).closest('.vacation').append(price);
      $(this).remove();
    });
  });
  ```
    * this will only function on clicks for buttons within the vacation class

* Example for data jQuery Object Method:
  ```html
  <li class="vacation onsale" data-price='399.99'>
    <h3>Vacation in Europe</h3>
    <button>Price</button>
  </li>
  ```
  * `$('.vacation').data('price');` => "399.99"

* Class Manipulation
  * `.addClass(<class>)`
  * `.removeClass(<class>)`
  * `.hasClass(<class>)`
  * Example:
    ```javacript
    $(document).ready(function() {
      $('#filters').on('click', '.onsale-filter', function {
        $('.highlighted').removeClass('highlighted');
        $('.vacation').filter('.onsale').addClass('highlighted');
      });
    });
    ```
      * the removeClass line is used to remove any instances of highlighted elements before a new highlighted class is added in the next line

* Linking jQuery into html file:
  * Add script tag at the bottom of the body element of the html document (this needs to be last to make sure the rest of the html content is added to the DOM before any script is placed on it)
  * `<script src="jQuery.js"></script>`
