# Game Finder API

> This is the Backend API for the Game Finder App.

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.3.4
- Rubocop
- Rspec

## Live Demo

This API is deployed on Heroku, but it is only accessible for the [GameFinder](https://github.com/Miguelus373/Game-Finder) Frontend

## API Endpoints

This API currently has 7 Endpoints that return different kinds of data
> NOTE: For every single endpoint (except /login and /signup) the api uses a validation token to check that the current user is logged in. If the user is not logged in, he/she won't have access to the App

### User 

- GET /users/:id validates the current user. Once it passes the validations, it retrives the information about the user with the requested id and return its info along with that user's favourite games

- POST /signup/:username checks if the provided username already exists in the database. If it exists, returns an error. If it doesn't exist, creates a new user with the provided username and returns the new user id and its validation token

- POST /login/:username similar to the previous endpoint but it checks if the user already exists and if it does, returns its information(id and token). Otherwise, returns an error

### Games

- GET /games validates the user using its and then returns the full list of games

- GET /game/:id validates the user and then returns the information about a single game (currently not in use)

### Favourites

- POST /favourites?user_id&game_id validates the user and adds the game with the provided id to the list of favourite games of the user

- DELETE /favourites/:id validates the user and destroys the favourite with the provided id

---

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby 2.7+
Rails 6+
Postgres: 9.5+

### Setup

Get a local copy by running this command on your terminal:

```
git clone git@github.com:Miguelus373/Game-Finder.git
```

Install all required gems with:

```
bundle install
```

Setup database with:

```
   rails db:create 
   rails db:migrate
```

### Usage

Start a server with:

```
    rails server
```

Go to your [localhost](http://localhost:3000/) on your browser.


### Run tests

In this API we have unit tests for models, controllers, requests and routes.

> To check them out just run the following command:

```
    bundle exec rpsec
```

---

## ✒️ Author

👤 **Miguel Uzcátegui**

- Github: [@Miguelus373](https://github.com/Miguelus373)
- LinkedIn:[LinkedIn](https://www.linkedin.com/in/Miguelus373)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Miguelus373/Game-Finder-Api/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- This is the Final Capstone Project for Microverse


## 📝 License
This project is [MIT](https://github.com/Miguelus373/Game-Finder/blob/develop/LICENSE) licensed.

