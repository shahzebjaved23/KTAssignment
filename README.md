Run Rake Task To create users for testing

- rails user_admin:create

This will create the users with email and password, one with admin role, and other with readonly

Authenticate Requests with Authorization Header

- headers: { Authorization: "user_auth_token" }

To get the User Auth Token, send following request

-URL: /login
-METHOD: POST
-REQUEST PARAMS: {
	user: {
		email: "admin@email.com",
		password: "password"
	}
}

To run Specs Run

- rspec spec