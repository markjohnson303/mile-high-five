#Mile High Five

###A curated event listing for Denver
Mile High Five is a curated listing of 5 things to do in Denver every week. It also includes a list of user-submitted events that can be voted up or down. Every event liting includes a page for details such as a map, images, and user comments. The app will include an admin dashboard for curating future weeks and moderating existing events.

##Roadmap
[A roadmap of upcoming features is available on Trello](https://trello.com/b/xAMNYZCn/mile-high-five)

##Wireframes and Data Models
[Home page and event listing](wireframes/home.jpg)

##Routes
###GET all upcoming events ('/')
Will return all events in the future, and the 

###GET this week's curated list
Will return the five events for this week

###GET a single event ('/event/:id')
Will return the details for a single event

###POST a new event ('/event/create')
Will all the user to submit a new event

###POST a new High Five ('/admin/high-5/')
Will allow an admin/moderator to add a curated listing for a given week

###PUT an existing High Five ('admin/high-5/:id')
Will allow an admin/moderator to add 

###DELETE an event ('/event/:id')
Will allow an admin/moderator to remove an event

###PUT an event ('/event/:id')
Will allow an admin/moderator to edit an event

