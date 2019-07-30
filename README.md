# README

## Creating the rails app

## Stage One

- /DEVO/rails new SPAex-alt -T --database=postgresql
- cd SPAex

## TRIAL:  CREATE A FULL RAILS SCAFFOLD

- rails g scaffold User last_name first_name gender:boolean:false

- bundle add 'rails-hyperstack' --version "~> 1.0.alpha1.0" (CR)  add the rails-hyperstack gem to Gemfile

- bundle install

- bundle exec rails hyperstack:install

- bundle install

### Create and migrate User table
- rake db:create db:migrate

### Create a user
- rake db:seed

- bundle exec foreman start

- URL:  localhost:5000  (CR)  This will compile Webpack and takes 3-4 minutes; see 'App' in ULC of page


## Stage Two


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
