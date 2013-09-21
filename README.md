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


+++ TODO
Handle Duplicate Errors.
(loosen up validations for webcraft ids to be uniqe )

2 food trucks can have 2 different twitter accounts, but share the same fb url, or the same yelp id

1 yelp id can have 2 twitter accounts

either allow duplication by default,
or flag duplicates and require a -force to create a dup

Think a little about how chains would be handled

"{"meta":{"error":"The operation: #\u003CMoped::Protocol::Command\n  @length=89\n  @request_id=3\n  @response_to=0\n  @op_code=2004\n  @flags=[]\n  @full_collection_name=\"craft_service_development.$cmd\"\n  @skip=0\n  @limit=-1\n  @selector={:getlasterror=\u003E1, :safe=\u003Etrue}\n  @fields=nil\u003E\nfailed with error 11000: \"E11000 duplicate key error index: craft_service_development.crafts.$yelp_craft.web_craft_id_1  dup key: { : \\\"melange-creperie-houston\\\" }\"\n\nSee https://github.com/mongodb/mongo/blob/master/docs/errors.md\nfor details about this error.","action_time":0.516111},"data":{}}"



The operation: #<Moped::Protocol::Command   @length=89   @request_id=3   @response_to=0   @op_code=2004   @flags=[]   @full_collection_name="craft_service_development.$cmd"   @skip=0   @limit=-1   @selector={:getlasterror=>1, :safe=>true}   @fields=nil> failed with error 11000: "E11000 duplicate key error index: craft_service_development.crafts.$facebook_craft.web_craft_id_1  dup key: { : \"306337737058\" }"  See https://github.com/mongodb/mongo/blob/master/docs/errors.md for details about this error.


