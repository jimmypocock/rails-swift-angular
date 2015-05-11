== README

To set up API:
  - `git clone <URL>`
  - `cd json-test-app/json-test-api`
  - `bundle install`
  - `rake db:create && rake db:migrate`
  - `rails s`






### Example of User Row

```
{
  first_name: "Bobby",
  last_name:  "Tables",
  bio: "Causes all kinds of problems",
  phone: "111-111-1111",
  email: "droptables@gmail.com"
}
```


### Routes

```
    users   GET    /users(.:format)          users#index
            POST   /users(.:format)          users#create
 new_user   GET    /users/new(.:format)      users#new
edit_user   GET    /users/:id/edit(.:format) users#edit
     user   GET    /users/:id(.:format)      users#show
            PATCH  /users/:id(.:format)      users#update
            PUT    /users/:id(.:format)      users#update
            DELETE /users/:id(.:format)      users#destroy
```



### GET `/users`
```
curl -s -H "Accept: application/json"  \
        -H "Content-Type: application/json"  \
        -X GET http://localhost:3000/users \
        | python -mjson.tool
```


### GET `/users/:id`
```
curl -s -H "Accept: application/json"  \
        -H "Content-Type: application/json"  \
        -X GET http://localhost:3000/users/:id \
        | python -mjson.tool
```


### POST `/users`
```
curl -s -H "Accept: application/json"  \
        -H "Content-Type: application/json"  \
        -X POST http://localhost:3000/users \
        -d '{"user":{"first_name":"Bobby","last_name":"Tables","bio":"Causes all kinds of problems","phone": "111-111-1111","email": "droptables@gmail.com"}}' \
        | python -mjson.tool
```


### PUT `/users/:id`
```
curl -s -H "Accept: application/json"  \
        -H "Content-Type: application/json"  \
        -X PUT http://localhost:3000/users/:id \
        -d '{"user":{"first_name":"Robert","last_name":"Tables","bio":"Such a sweet boy","phone": "222-222-2222","email": "droptablizzies@gmail.com"}}' \
        | python -mjson.tool
```


### DELETE `/users`
```
curl -s -H "Accept: application/json"  \
        -H "Content-Type: application/json"  \
        -X DELETE http://localhost:3000/users/11 \
        | python -mjson.tool
```
