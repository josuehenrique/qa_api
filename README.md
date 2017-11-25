# README

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
