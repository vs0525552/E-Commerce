-----User Registration API-----

This endpoint allows for the registration of a new user in the system. It accepts user details in the request body and returns a response indicating the success or failure of the registration process.
Request
Method: POST
URL: http://localhost:8080/api/user/register

Request Body
The request body must be in JSON format and include the following parameters:
userName (string): The desired username for the new user.
email (string): The email address of the user, which must be unique.
password (string): The password for the user account, which should meet security requirements.

Example Request Body:


JSON








{
  "userName": "exampleUser",
  "email": "example@example.com",
  "password": "SecurePassword123"
}


Response
Upon successful registration, the API will return a response indicating the result of the operation. The response body may include:
status (string): Indicates whether the registration was successful or failed.
message (string): A message providing additional context about the registration result.

Example Response:


JSON








{
  "status": "success",
  "message": "User registered successfully."
}


Notes
Ensure that the email provided is unique and valid to avoid registration errors.
Passwords should adhere to security guidelines to enhance account protection.

This endpoint allows users to register a new account by providing their username, email, and password.
Request
Method: POST
URL: localhost:8080/api/user/register
Content-Type: application/json

Request Body Parameters
userName (string): The desired username for the new account. This should be unique and not already in use.
email (string): The email address associated with the account. This will be used for account verification and password recovery.
password (string): The password for the account. It should meet security requirements (e.g., minimum length, complexity).

Expected Response
Upon successful registration, the server will respond with a confirmation message, typically indicating that the user has been successfully registered. The response may also include a user ID or token for further authentication.
Notes
Ensure that the username and email are unique to avoid conflicts.
The password should adhere to the security policies in place (e.g., length, special characters).
If registration fails, the response will include an error message detailing the reason for the failure (e.g., username already taken, invalid email format).


________________________________________________________________________
-----User Login API-----

This endpoint allows users to log in to the application by providing their credentials. Upon successful authentication, the server returns a JSON Web Token (JWT) that can be used for subsequent requests requiring authentication.
Endpoint
POST /api/user/login
Request Parameters
The request must include a JSON object in the body with the following parameters:
email (string): The email address of the user attempting to log in. This is a required field.
password (string): The password associated with the user's account. This is a required field.

Example Request Body


JSON








{
  "email": "user@example.com",
  "password": "yourpassword"
}


Authentication Method
This endpoint does not require any additional authentication headers. The user must provide valid credentials (email and password) in the request body.
Response
On a successful login, the server responds with a status code of 200 and a JSON object containing the following fields:
jwtToken (string): The JSON Web Token that can be used for authenticated requests.
username (string): The username of the authenticated user.

Example Response


JSON








{
  "jwtToken": "your_jwt_token_here",
  "username": "your_username_here"
}


Notes
Ensure that the email and password provided are correct to receive a valid JWT token.
The JWT token should be stored securely and included in the Authorization header for subsequent requests to protected endpoints.

This endpoint allows users to authenticate by logging in with their credentials. Upon successful authentication, users will receive a JSON Web Token (JWT) that can be used for subsequent requests to access protected resources.
Request
Method
POST
URL
http://localhost:8080/api/user/login
Request Body
The request must include a JSON object with the following parameters:
email (string): The email address of the user attempting to log in.
password (string): The password associated with the user's account.

Example Request Body


JSON








{
  "email": "user@example.com",
  "password": "your_password_here"
}


Response
Status Code
200 OK
Content-Type
application/json
Response Body
On a successful login, the response will contain the following fields:
jwtToken (string): The JSON Web Token issued for the authenticated session.
username (string): The username of the authenticated user.

Example Response Body


JSON








{
  "jwtToken": "your_jwt_token_here",
  "username": "your_username_here"
}


Usage
Users should input their credentials in the login form to authenticate and access this endpoint. Ensure that the email and password are correctly provided to receive a valid JWT for further interactions with the API.

_________________________________________________________________________
-----API Endpoint: Retrieve Products-----

Request
Method: GET
URL: http://localhost:8080/api/product

Description
This endpoint retrieves a list of products available in the system. It does not require any request parameters.
Response
Status Code: 200 OK
Content-Type: application/json

Response Body
The response is a JSON array containing product objects with the following structure:
productId: (string) Unique identifier for the product.
name: (string) Name of the product.
description: (string) Description of the product.
price: (number) Price of the product.
stockQuantity: (number) Quantity of the product available in stock.
unit: (string or null) Unit of measurement for the product.
vendorId: (string) Identifier for the vendor supplying the product.
category: (string) Category to which the product belongs.
image: (string or null) URL or path to the product image.

Notes
This endpoint returns an array of products, and each product object contains essential information needed for display or further processing.
Ensure that the server is running and accessible at the specified URL to receive the expected response.



_________________________________________________________________________