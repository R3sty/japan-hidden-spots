CREATE TABLE users (
  user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE spots (
  spot_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  spot_name VARCHAR(255) NOT NULL,
  prefecture VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE reviews (
  review_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  spot_id INT NOT NULL REFERENCES spots(spot_id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL CHECK (rating between 1 and 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, spot_id) /*creates a rule that a user can only give 1 review per spot*/
)

/**
User  =>  Spots   => user can add spots
User  =>  Reviews   =>  user can write reviews
spots => Reviews    => Spots can receive reviews
*/


/*
API Endpoints

POST  /users   create new account
GET   /users/:id   get account

POST  /spots  create new spot
GET   /spots   get all spots
GET   /spots/:id   get one spot
PATCH /spots/:id  update/edit spot
DELETE  /spots/:id   delete spot

POST /spots/:id/reviews  create new review
GET /spots/:id/reviews   get review for a spot\
PATCH  /spots/:id/reviews/:review_id  update/edit reviews
DELETE /spots/:id/reviews/:review_id   delete a review

*/