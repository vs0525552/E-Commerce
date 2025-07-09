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
-----API Endpoint: Retrieve Product Details-----

Method: GET
URL: http://localhost:8080/api/product/{productId}
This endpoint retrieves detailed information about a specific product based on its unique identifier (productId). The productId should be provided as part of the URL path.
Request Parameters
productId (path parameter): The unique identifier of the product you wish to retrieve. This should be a string that corresponds to the product's ID in the database.

Response Structure
On a successful request, the server responds with a JSON object containing the following fields:
productId (string): The unique identifier for the product.
name (string): The name of the product.
description (string): A brief description of the product.
price (number): The price of the product, represented as a numerical value.
stockQuantity (number): The quantity of the product available in stock.
unit (string or null): The unit of measurement for the product (e.g., "kg", "pcs"). This may be null if not applicable.
vendorId (string): The identifier for the vendor supplying the product.
category (string): The category to which the product belongs.
image (string or null): A URL or path to the product image, which may be null if no image is available.

Example Response


JSON








{
  "productId": "",
  "name": "",
  "description": "",
  "price": 0,
  "stockQuantity": 0,
  "unit": null,
  "vendorId": "",
  "category": "",
  "image": null
}


This response structure provides a comprehensive overview of the product's details, allowing consumers of the API to understand the product's attributes effectively.


Method: GET
URL: http://localhost:8080/api/product/{productId}
This endpoint retrieves detailed information about a specific product based on the provided productId. The productId is a unique identifier for the product in the database.
Request Parameters
productId (path parameter): A string representing the unique identifier of the product you wish to retrieve. This should be included in the URL.

Response Structure
On a successful request (HTTP Status 200), the response will be in JSON format and will include the following fields:
productId: The unique identifier of the product (string).
name: The name of the product (string).
description: A brief description of the product (string).
price: The price of the product (number).
stockQuantity: The quantity of the product available in stock (number).
unit: The unit of measurement for the product (string or null).
vendorId: The identifier for the vendor supplying the product (string).
category: The category to which the product belongs (string).
image: A URL or path to the product image (string or null).

This endpoint is useful for clients that need to display product details to users or for inventory management purposes.



_________________________________________________________________________

-----Add Item to Cart-----

Update Cart API
This endpoint allows you to update the cart for a specific product identified by the productId.
Request
Method: POST
URL: /api/cart/{productId}

Response
The response will return a JSON object with the following structure:
userId: (string) The ID of the user associated with the cart.
products: (array) A list of products in the cart, each containing:
productId: (string) The unique identifier for the product.
name: (string) The name of the product.
description: (string) A brief description of the product.
price: (number) The price of the product.
stockQuantity: (number) The available stock quantity of the product.
unit: (string or null) The unit of measurement for the product.
vendorId: (string) The ID of the vendor providing the product.
category: (string) The category to which the product belongs.
image: (string or null) A URL or path to the product image.

noOfItems: (number) The total number of items in the cart.
totalAmount: (number) The total amount for all items in the cart.

Notes
Ensure to replace {productId} in the URL with the actual product ID when making the request.


This endpoint allows users to add items to their shopping cart. By sending a POST request to the specified URL, the user can update their cart with the desired product details.
Request Parameters




Expected Input
The request body should include the following parameters in JSON format:
userId (string): The identifier for the user who owns the cart.
products (array): A list of products to be added to the cart, where each product object contains:
productId (string): The unique identifier for the product.
name (string): The name of the product.
description (string): A brief description of the product.
price (number): The price of the product.
stockQuantity (number): The available stock quantity of the product.
unit (string or null): The unit of measurement for the product (e.g., kg, pcs).
vendorId (string): The identifier for the vendor of the product.
category (string): The category under which the product falls.
image (string or null): A URL or path to the product image.


Response Structure
Upon a successful request, the server responds with a JSON object containing the following fields:
userId (string): The identifier of the user associated with the cart.
products (array): An array of product objects currently in the cart, each containing the same fields as described in the input.
noOfItems (number): The total number of items in the cart.
totalAmount (number): The total monetary amount of all items in the cart.

Example Response


JSON








{
  "userId": "",
  "products": [
    {
      "productId": "",
      "name": "",
      "description": "",
      "price": 0,
      "stockQuantity": 0,
      "unit": null,
      "vendorId": "",
      "category": "",
      "image": null
    }
  ],
  "noOfItems": 0,
  "totalAmount": 0
}


This endpoint is essential for managing the user's shopping cart effectively, allowing them to add products and view their cart's contents.







_________________________________________________________________________
-----Minus Product from Cart-----

This endpoint allows you to delete a specific product from the user's shopping cart using the product ID.
Request
Method: DELETE
URL: http://localhost:8080/api/cart/{productId}

Path Parameters
productId (string): The unique identifier of the product to be removed from the cart.

Response
Status Code: 200 OK
Content-Type: application/json

Response Body
The response will return a JSON object with the following structure:
userId (string): The ID of the user associated with the cart.
products (array): An array containing the products currently in the cart. It will be empty if there are no products.
noOfItems (integer): The total number of items in the cart after the deletion.
totalAmount (number): The total monetary amount of the items in the cart after the deletion.

Example Response


JSON








{
    "userId": "",
    "products": [],
    "noOfItems": 0,
    "totalAmount": 0
}


This endpoint is useful for managing the contents of a user's shopping cart by allowing the removal of specific products based on their unique product ID.


This endpoint is used to delete a specified shopping cart from the system. The cart is identified by its unique cartId, which is provided in the URL path.
Request Parameters
cartId (path parameter): A string representing the unique identifier of the shopping cart to be deleted.

Response Structure
Upon successful deletion of the cart, the API responds with a status code of 200 and returns a JSON object containing the following fields:
userId: A string representing the user associated with the cart. This will typically be empty if the cart is deleted.
products: An array of products that were in the cart. This will be empty as the cart has been deleted.
noOfItems: An integer indicating the number of items in the cart, which will be 0 after deletion.
totalAmount: A numeric value representing the total amount of the cart, which will also be 0 after deletion.

This endpoint is essential for managing the shopping cart functionality, allowing users to remove carts that are no longer needed.


_________________________________________________________________________
-----Delete Product from Cart-----

This endpoint allows the user to remove a complete product from the shopping cart using the product ID. 
Request
Method: DELETE
URL: http://localhost:8080/api/cart/{productId}/
Replace {productId} with the ID of the product you wish to remove from the cart.


Response
Status Code: 200
Content-Type: application/json
Response Body:
userId: Identifier for the user.
products: An array of products currently in the cart, which will be empty if the product was successfully removed.
productId: The ID of the product.
name: The name of the product.
description: A brief description of the product.
price: The price of the product.
stockQuantity: The quantity of the product available in stock.
unit: The unit of measurement for the product (if applicable).
vendorId: The ID of the vendor selling the product.
category: The category under which the product is listed.
image: A URL or path to the product image (if available).

noOfItems: Total number of items remaining in the cart after the deletion.
totalAmount: The total amount of the cart after the product removal.




This endpoint is used to delete a specific cart identified by the cartId. It allows users to remove an entire shopping cart from the system.
Request Parameters
cartId (path parameter): The unique identifier of the cart that you want to delete. This is a required parameter and should be included in the URL.

Response Structure
Upon successful deletion of the cart, the API will return a JSON response with the following structure:
userId: The ID of the user associated with the cart (string).
products: An array of products that were in the cart. Each product object contains:
productId: The unique identifier of the product (string).
name: The name of the product (string).
description: A brief description of the product (string).
price: The price of the product (number).
stockQuantity: The quantity of the product available in stock (number).
unit: The unit of measurement for the product (string or null).
vendorId: The ID of the vendor selling the product (string).
category: The category to which the product belongs (string).
image: A URL or path to the product image (string or null).

noOfItems: The total number of items in the cart after deletion (number).
totalAmount: The total monetary amount of the cart after deletion (number).

Status Codes
200 OK: The cart was successfully deleted, and the response contains the updated cart information.


_________________________________________________________________________

-----Retrieve Cart Information-----

This endpoint retrieves the current user's shopping cart details.
Request
Method: GET
URL: http://localhost:8080/api/cart

Response
Status Code: 200 OK
Content-Type: application/json

Response Body


JSON








{
  "userId": "",
  "products": [
    {
      "productId": "",
      "name": "",
      "description": "",
      "price": 0,
      "stockQuantity": 0,
      "unit": null,
      "vendorId": "",
      "category": "",
      "image": null
    }
  ],
  "noOfItems": 0,
  "totalAmount": 0
}


Response Fields
userId: Identifier for the user.
products: List of products in the cart.
productId: Identifier for the product.
name: Name of the product.
description: Description of the product.
price: Price of the product.
stockQuantity: Available stock for the product.
unit: Measurement unit for the product.
vendorId: Identifier for the vendor.
category: Category of the product.
image: URL of the product image.

noOfItems: Total number of items in the cart.
totalAmount: Total cost of items in the cart.



This endpoint retrieves the current state of the user's shopping cart. It provides details about the user, the products in the cart, the number of items, and the total amount.
Request
Method: GET
URL: http://localhost:8080/api/cart

Response
Status Code: 200 OK
Content-Type: application/json

Response Body
The response body returns a JSON object with the following structure:
userId: (string) The unique identifier of the user.
products: (array) A list of products currently in the cart. Each product object contains:
productId: (string) The unique identifier of the product.
name: (string) The name of the product.
description: (string) A brief description of the product.
price: (number) The price of the product.
stockQuantity: (number) The quantity of the product available in stock.
unit: (string|null) The unit of measurement for the product (if applicable).
vendorId: (string) The unique identifier of the vendor supplying the product.
category: (string) The category to which the product belongs.
image: (string|null) A URL or path to the product's image (if available).

noOfItems: (number) The total number of items in the cart.
totalAmount: (number) The total monetary amount of the items in the cart.

This structure allows clients to easily understand the contents of the cart and the associated details for each product.
This endpoint retrieves the current user's shopping cart details. It returns information about the items in the cart, including product details, total number of items, and the total amount.
Request
Method: GET
URL: http://localhost:8080/api/cart

Response
Status Code: 200 OK
Content-Type: application/json

Response Structure
The response is a JSON object containing the following fields:
userId: A string representing the unique identifier of the user.
products: An array of product objects, each containing:
productId: A string representing the unique identifier of the product.
name: A string representing the name of the product.
description: A string providing a description of the product.
price: A number indicating the price of the product.
stockQuantity: A number indicating the available stock quantity of the product.
unit: A string representing the unit of measurement for the product (can be null).
vendorId: A string representing the unique identifier of the vendor.
category: A string indicating the category of the product.
image: A string representing the URL of the product image (can be null).

noOfItems: A number indicating the total number of items in the cart.
totalAmount: A number representing the total amount for all items in the cart.

This endpoint is useful for users to view their current cart status, including all products added, total items, and the overall cost.
Request
Method: GET
Endpoint: /api/cart

Description
This endpoint retrieves the current user's shopping cart information. It is designed to provide details about the items in the cart, including product specifications and the total amount.
Expected Response
Upon a successful request, the server responds with a status code of 200 and a JSON object containing the following fields:
userId (string): The identifier of the user associated with the cart.
products (array): A list of products currently in the cart. Each product object includes:
productId (string): The unique identifier for the product.
name (string): The name of the product.
description (string): A brief description of the product.
price (number): The price of the product.
stockQuantity (number): The quantity of the product available in stock.
unit (string or null): The unit of measurement for the product (e.g., kg, lb).
vendorId (string): The identifier for the vendor supplying the product.
category (string): The category to which the product belongs.
image (string or null): A URL or path to an image of the product.

noOfItems (number): The total number of items in the cart.
totalAmount (number): The total monetary amount of all items in the cart.

This structured response allows clients to easily understand the contents of the cart and take further actions as needed.

__________________________________________________________________________________________________________________________________________

-----Forgot Password Endpoint------

This endpoint allows users to reset their password by providing their registered email address. It is intended for users who have forgotten their password and need to initiate the password recovery process.
Request
Method: PUT
URL: http://localhost:8080/api/user/forgotPassword
ParameterTypeDescriptionemailstringThe email address associated with the user account.passwordstringThe new password that the user wishes to set.

Example Request Body


JSON








{
  "email": "user@example.com",
  "password": "newPassword123"
}


Response
Upon successful execution, the server will respond with a status code of 200 and a JSON object containing the following fields:
FieldTypeDescriptionuserId


Example Response


JSON








{
  "userId": "",
  "userName": "",
  "email": "",
  "password": null,
  "address": null,
  "role": "",
  "registrationDate": ""
}


This response indicates that the password reset process was initiated successfully, but does not return sensitive user information.




_____________________________________________________________________________________________________________________________________________


HSN no. requ for vendor