# Wolf Tours And Travels <br>
## Description<br>
Heroku App Link: https://infinite-forest-63165.herokuapp.com/
<br>
This project is a tour management system application built in Ruby on Rails. 
_______________________________________________________________________<br>

### Login And Logout<br>

Agent, Customer and Agent can log in and log out of the application. <br>
Admin Credentails: <br>
Username: "Admin" <br>
Password: "TopSecret" <br>
<br>
Customer and Agent can login only after they signup from the link "Signup" provided on Login Page.<br>
Validations added on Signup page:
* Username should be unique.
* Email Id should be valid.
* Password should match.
* All fields are mandatory. 
<br>
Once the user has signed up they will be redirected to the login page and the user can login into the system<br>
__________________________________________________________________________________________________<br>

### Admin<br>

An admin should be capable of performing all operations performed by Agent or Customer. <br>
Admin accounts cannot be deleted.<br>
Tasks performed by admin: <br>
* Log in with an email and password: Go to the login page and enter the Admin credentials mentioned above.<br>
* Edit profile: Log in as the Admin, and click on the Profile link on the home page. You will see a list of all users in the system. Look for the Admin and click edit link next it.<br>
* Log out: Click on logout link in the botton of the page.<br>
* Create agent and customer accounts (users): This functionality has not been implemented.<br>
* Create a new tour: Log in as the Admin, and click the New Tour link to create a new tour.<br>
* Delete tours from the system: Log in as the Admin, and all tours should be listed and edit and delete buttons are right next to each listing.<br>
* Delete users: Log in as Admin, and click on the Profile link on the home page. You will see a list of all users in the system. Look for the Admin and click delete link next it.<br>
* Delete reviews: Log in as the Admin, Click on List of Reviews, and click on destroy button for a specific review to delete it.<br>
* View the list of all users and their profile details (except password).: Log in as the Admin, Click on the profile link and click delete button next to a user listing to delete the user. Note: Admin user cannot be deleted.<br>
* View the list of all tours, along with detailed information: Log in as the Admin and the home page id the list of tours and all their information.<br>
* View list of users who have booked a tour: Click on the show button for a particular tour, and click on You Bookings to see all the customers who have booked seats for the tour.<br> 
* View all fields of reviews: Log in as Admin, and click on the List of Reviews link.<br>
_______________________________________________________________________<br>

### Customer <br>

* Sign up as a customer: On the Login page, click on the sign up link. Anyone can sign up as a customer using their email, name and password. and choose the role as a customer and click create user.<br>
* Log in with email and password: Go to the login page and enter the customer credentials you created above.<br>
* Edit profile: Log in as the Customer, and click on the Profile link on the home page. You will see your profile. Click edit link next it.<br>
* Log out: Click on logout link in the botton of the page.<br>
* Bookmark Tours: Log in as the Customer, and click on show tour for the tour you are interested in. Click on Bookmark Tour to bookmark that tour.<br>
* cancel partial number of reserved seats: This functionality is not implemented. The person can however, edit their booking to make the changes in the number of seats. <br>
* Cancel the entire booking: Log in as the Customer, click on show for a tour that you are interested in. Click on My Bookings and you can click on delete for whichever booking you wish to delete. <br>
* Convert waitlist to a booking when a booking is cancelled: Create two customer profiles and create a booking with one and a waitlist with another. Cancel the booking and the waitlist will cet converted to a confirmed booking. <br>
_______________________________________________________________________<br>

### Agent <br>

* Sign up as an agent: On the Login page, click on the sign up link. Anyone can sign up as an agent using their email, name and password. and choose the role as an agent and click create user.<br>
* Edit profile: Log in as the Agent, and click on the Profile link on the home page. You will see your profile. Click edit link next it.<br>
* Create a new tour: Log in as the Agent, and click the New Tour link to create a new tour.<br>
* Edit tour that they have created: Log in as the Agent, click the button 'edit' next to the tour you wish to edit. If you have created the tour, you will be able to edit it. Otherwise an error message will be displayed.<br>
* View the list of all tours, along with detailed information: Log in as the Agent and on the home page you will see the list of tours and all their information.<br>
* Delete tour that they have created: Log in as the Agent, click the button 'destroy' next to the tour you wish to delete. If you have created the tour, you will be able to delete it. Otherwise an error message will be displayed.<br>
* View list of users who have booked a tour: Click on the show button for a particular tour, and click on Your Bookings to see all the customers who have booked seats for the tour.<br>
* View all fields of reviews: Log in as an Agent, and click on the List of Reviews link.<br>
* View list of users who have bookmarked a tour: Click on the show button for a particular tour, and click on Your Bookmarks to see all the customers who have booked seats for the tour.<br>
_______________________________________________________________________<br>

### Tours <br>

* Create a new tour: Log in as the Admin or an agent, and click on the New tour link. <br>
* Upload photos for a tour: This functionality has not been implemented.<br>
* Validations: <br>
* Itinenary: Lod in as the Admin or an Agent, create a new tour, after entering tour details you are redirected to fill out an itinenary. You can add more than one if you wish to do so.<br>
* Notification email when a seat is confirmed: This functionality is not implemented.<br>
* Using LinkedIn/Google/Facebook accounts to log in: This functionality is not implemented.<br>
* Search: Log in, and click Search on the top of the page. You will be provided with many fields to search with. You can fill in as many as you want and leave the rest blank. The search functionality will consider only the filters that you chose to fill in. <br>
* Search based on Date, Price Range, Itinenary and Name have been implemented. <br>
* Booking a Tour: Login as the customer or an Admin, Click on show for a tour that you are interested in. Click on Book tour and you will be redirected to a booking form. Fill in the form. There are a list of options that are given to the customer in case the requested number of seats are not available. the options and their meanings are as follows: <br>
  1) only book available seats: If requested seats are more than available seats, only the available seats will be booked.  Otherwise, book the requested seats.<br>
  2) Book available seats and waitlist the rest: If requested seats are more than available seats, the available seats will be booked and the rest of the seats will be waitlisted. Otherwise, book the requested seats.<br>
  3) If all seats are not available, then waitlist all: If requested seats are more than available seats, all of the seats will be waitlisted. Otherwise, book the requested seats. <br>
  4) If seats are not available, cancel the booking: If requested seats are more than available seats, cancel the booking. <br>
* Bookmark Tours: Log in as the Customer, and click on show tour for the tour you are interested in. Click on Bookmark Tour to bookmark that tour.<br>
* cancel partial number of reserved seats: This functionality is not implemented. The person can however, edit their booking to make the changes in the number of seats. <br>
* Cancel the entire booking: Log in as the Customer, click on show for a tour that you are interested in. Click on My Bookings and you can click on delete for whichever booking you wish to delete. <br>
* Convert waitlist to a booking when a booking is cancelled: Create two customer profiles and create a booking with one and a waitlist with another. Cancel the booking and the waitlist will cet converted to a confirmed booking. <br>

_______________________________________________________________________<br>

### Testing <br>
* The users model has been tested. The controller has not been tested.
