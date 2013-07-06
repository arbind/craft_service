# Craft Service API

| Tech Stack
|
| Redis
| MongoDB
| Ruby 2
| Rails 4
| Jbuilder

## Endpoints for /api/v1:

### &Xi; Access Token
````
POST  /token         :credentials -> 200: :token
````

### &#10003; Crafts
````
GET   /crafts                    -> 200: [:craft]
POST  /crafts             :craft -> 201: :craft
GET   /crafts/:id                -> 200: :craft
PATCH /crafts/:id         :craft -> 202: :craft
DEL   /crafts/:id                -> 202: :craft
````


## Messages for api.v1:

### &Xi; Social Activity
````
new.tweet
new.fb.like
new.twitter.follower
````

### &Xi; Application Activity
````
new.favorite
new.checkin
````

## Start Server:
````
bundle
rails s
open http://localhost:3000/businesses
````
Make sure MongoDB is running.


## Execute Specs:
````
rake
````

## To Contribute:
````
1. fork the project
2. create a feature branch
3. make a pull request
````
| Key
|
| &#10003; Complete
| &hearts; In Progres
| &Xi; ToDo
