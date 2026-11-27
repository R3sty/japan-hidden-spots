API Endpoints

- POST /api/auth/signup create new account
- POST /api/auth/login log in
- POST /api/auth/logout log out
- GET /api/auth/me get currently logged in user
- GET /api/users/:id get a specific user's profile

- POST /api/spots create new spot
- GET /api/spots get all spots
- GET /api/spots?user=me get the logged in user's spots
- GET /api/spots/:id get one spot
- PATCH /api/spots/:id update/edit spot
- DELETE /api/spots/:id delete spot

- POST /api/spots/:id/reviews create new review
- GET /api/spots/:id/reviews get review for a spot\
- PATCH /api/spots/:id/reviews/:review_id update/edit reviews
- DELETE /api/spots/:id/reviews/:review_id delete a review
