Summary:

MyTop10 is a live website (www.mytoptenranker.com) where users can rank the best of various categories--subjects ranging from widely debated (e.g., best NBA players of all time) to niche (e.g., best iterations of Superman). Individual user submissions are amalgamated to produce Overall Rankings for each category.

Purpose:

The project's primary purpose is to showcase my technical knowledge developed through OpenAppAcademy's Full Stack Engineer bootcamp. Ruby/Rails and PSQL are employed for the back-end. The front-end is managed by custom javascript and css. The rest of this document will highlight selected features and functionality.

Auth:

Most of the code relating to authentication can be found in the User model, UsersController, SessionsController and ApplicationController. I have also configured Rails' ApplicationMailer to send emails with account verification links, which in turn send an http request to the activation url with a user's unique activation token. There is both an html option and a text option for emails. Once a user is activated, their sessions are maintained and destroyed through a session token stored both in the user's cookies and in the database. 

Passwords are encyrpted/salted with functions from the Bycrypt gem. 

Certain pages and functions are restricted based on user. For example, a user cannot see another user's profile page, nor can they delete another user's ranking. This is accomplished through the session token. 

Finally, csrf tokens are provided by Rails, and custom javascript in signToggle.js and deleteRanking.js accesses the token through the meta element in which it is stored and send it to the server with an XHR request. 

Model Relationships and Validations:

Rails renders direct SQL unnecessary in this application. The belongs_to and has_many relationships facilitate much of the functionality, such as maintaining the correct Overall Rankings based on all of the individual rankings for any category. A virtual column in each Option (a resource to be ranked 1-10 within a category) tracks its "score." This score is calculated based on how many rankings have been submitted listing the option at each rank (1-10). Those numbers are mainained through custom methods defined in rankings.rb and employed in the RankingsController when a ranking is created, updated, or destroyed. 

Validations are in place at both the database and model level. For example, passwords must be at least six characters, and the content of a suggestion cannot be blank. 

Routes:

Routes are RESTful. Some custom routes are included beyond those provided by Rails' "resources." The url for generating the view for a new ranking was changed to include a ranking ID for easy access to the data associated with a particular Question (the model for different categories to be ranked). The recent rankings URL was created to provide a location for users to see the rankings of other users. 

ActiveSupport::Concern:

In app/assets/models/concern, I wrote a module that extends ActiveSupport::Concern, which facilitates searching the database by timestamp. I then simply call by_recently_created to get the most recently created rankings. I also have a by_recently_updated option in case I want to include edited rankings on the recent rankings page. These functions will help keep code DRY if ever I need to query the database based on timestamp again. 

Views

The views all rely on embedded ruby to dynamically generate html. A layout file holds the same header for all views. Many also rely on partials to keep code DRY, particularly in the views/rankings folder. The forms for submitting rankings are generated in the _form partial, which renders the _selector partial several times with a ruby loop. Each _selector partial renders the _options partial. 

Data is kept in the views to be sent in parameters to the server and accessed by javascript on the client side. For example, each select element holds a reference to the option it represents.  

Helper functions are used throughout the views. They are defined in ApplicationController.

Javascript

The client-side code uses Vanilla DOM manipulation. I was using jQuery until it was brought to my attention that jQuery is essentially obsolete and is not generally recommended for new projects. The choice to exclude jQuery also required the use of XMLHttpRequests in place of ajax. My front-end code has a smaller footprint as a result. 

app/assets/javascript/sortOptions.js is a file that controls the UI while a user is creating a ranking. An event listener on the list triggers a function that resorts the list based on the user's rankings. It also makes any selected ranking choice (such as rank 3) unselectable for the other options. When a user changes their ranking of a certain option, the newly unselected rank must become selectable again for the other options. This is accomplished by another event listener(onfocus)/callback function which saves the formerly selected rank in a data attribute in the select element. I initially wanted to uncouple the process of making ranks re-selectable from that of making ranks disabled, but I do them within the same loop in order to improve efficiency. 

The javascript_include_tag is used to link the scripts to the views. 











