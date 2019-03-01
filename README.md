# Wolf Tours And Travels
##Description<br>
Heroku App Link: https://infinite-forest-63165.herokuapp.com/
<br>
This project is a tour management system application built in Ruby on Rails. The role-based access is implemented for this project based on the role: Agent, Customer or Admin. 
___________________________________________________________________________________________________________________________________<br>

### Login And Logout<br>
Agent, Customer and Agent can login and logout of the application <br>
Admin Credentails (within "")<br>
Username: "Admin" <br>
Password: "TopSecret" <br>
<br>
Customer and Agent can login only once they signup from the link "Signup" provided on welcome page<br>
Validations added on Signup page:
* Username should be unique
* Email Id should be valida
* Password should match
* All fields are mandatory 
<br>
Once signup is done, user can login into the system<br>
__________________________________________________________________________________________________<br>

### Admin<br>
An admin should be capable of performing all operations performed by Agent or Customer. <br>
Admin accounts cannot be deleted.<br>
Admin should be able to:<br>
Tasks performed by admin: <br>
* Log in with an email and password.<br>
* Edit profile.<br>
* Create agent and customer accounts (users).<br>
* View the list of all users and their profile details (except password).<br>
* View the list of all tours, along with detailed information.<br>
* View all fields of reviews (defined below) from customers.<br>
* Edit or delete users (agents or customers)/tours/reviews from the system.<br>
_____________________________________________________________________________________________________<br>

### Agent <br>
Anyone can sign up as an agent using their email, name and password. After signing up, they can perform the following tasks: 
* Login with email and password. <br>
* List a tour.  <br>
* Edit/update/delete/cancel tours that they have posted. <br>
* Cannot edit tours posted by other agents.<br>
* View all tours (including those listed by others).<br>
* View list of all customers who have bookmarked a tour (created by them).<br>
* View list of all customers who have booked a tour.<br>
* View reviews of a tour.<br>
* Agent should be able to delete his own account.<br>
______________________________________________________________________________________________________ <br>

### Customer <br>
Anyone can sign up as a customer using their email, name and password. After signup, they can perform the following tasks: <br>
* Log in with email and password.<br>
* Search available tours using filters, such as start date range, price range, tour name and locations visited during the tour (Itinerary)<br>
* Bookmark tours they are interested in.<br>
* View information about tours<br>
* Book n seats on a tour.<br>
* Cancel a booking completely or cancel a few seats from a booking done previously.<br>
* Submit a review for a tour that that customer has already taken.<br>
* Edit or delete a review they previously submitted.<br>
* Customer should be able to delete his own account.<br>
______________________________________________________________________________________________________ <br>
### Additional information related to Navigation <br>
Click **Show** link of a respective tour to : <br>
* Book that tour <br>
* Bookmark that tour <br>
* To see bookings for that tour(Bookings for agent tours or customer self bookings based on login role type) <br>
* To See bookmarks for that tour(Bookmarks for agent tours or customer self bookmarks based on login role type) <br>
* Write a review for that tour<br>
* Add Itinerary for that tour<br>

Click **Search** link on tour page to search tour based on <br>
* Tour name <br>
* Date Range <br>
* Price <br>
* Itinerary <br>
* Available Seats <br>
______________________________________________________________________________________________________________________________________


