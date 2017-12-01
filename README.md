# README
[![wercker status](https://app.wercker.com/status/4aa8144b368091202fd2b54d2ee2a356/s/master "wercker status")](https://app.wercker.com/project/byKey/4aa8144b368091202fd2b54d2ee2a356)

This RESTful readonly API is will provide questions and answers in json format suppressing private questions.
The HTTP response will be according with HTTP methods.

Things you may want to cover to build the project:
* Ruby version - 2.4.2
* Rails version - 5.1.4

**Steps to up this API**:
* Configure the database.yml
* $ bundle
* $ rake db:create && rake db:migrate
* $ rails s

**Steps to run tests**
* $ rake db:create RAILS_ENV=test
* $ rake db:migrate RAILS_ENV=test
* $ script/build

**Issue Tracker**
https://trello.com/b/oQ6yf2T1/qaapi

**Production URL**
https://qaapi.herokuapp.com/

**Available Routes**

| URL            | Verb |
|----------------|:----:|
| /users         | GET  |
| /users/:id     | GET  |
| /questions     | GET  |
| /questions/:id | GET  |
| /dashboard     | GET  |

**Available Tenants to make requests**
* **name**: Grey, **login**: grey, **api_key**: asdf342dsadf
* **name**: Melly, **login**: melly, **api_key**: asdf342234dss$adf

**Instructions**
* To make any request take some api key and put in header **api_key**.
* The API_KEY will identify tentant requester.
* Any request will be registered.
