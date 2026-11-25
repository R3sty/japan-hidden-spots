CREATE TABLE users (
  user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE spots (
  spot_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  spot_name VARCHAR(255) NOT NULL,
  prefecture VARCHAR(255) NOT NULL,
  category VARCHAR(50) NOT NULL CHECK (category IN ('restaurant', 'food_stall', 'sightseeing', 'local_shop', 'market', 'nature', 'cultural_site', 'accommodation', 'resort', 'theme_park')),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reviews (
  review_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  spot_id INT NOT NULL REFERENCES spots(spot_id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL CHECK (rating between 1 and 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, spot_id) /*creates a rule that a user can only give 1 review per spot*/
);

/**
User  =>  Spots   => user can add spots
User  =>  Reviews   =>  user can write reviews
spots => Reviews    => Spots can receive reviews
*/


/*
API Endpoints

POST  /api/auth/signup   create new account
POST  /api/auth/login   log in
POST  /api/auth/logout  log out
GET   /api/auth/me   get currently logged in user
GET   /api/users/:id  get a specific user's profile

POST  /api/spots  create new spot
GET   /api/spots   get all spots
GET   /api/spots?user=me  get the logged in user's spots
GET   /api/spots/:id   get one spot
PATCH /api/spots/:id  update/edit spot
DELETE  /api/spots/:id   delete spot

POST /api/spots/:id/reviews  create new review
GET /api/spots/:id/reviews   get review for a spot\
PATCH  /api/spots/:id/reviews/:review_id  update/edit reviews
DELETE /api/spots/:id/reviews/:review_id   delete a review

*/