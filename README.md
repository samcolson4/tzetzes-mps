# Tzetzes: MP News Search
[![Build Status](https://www.travis-ci.com/samcolson4/tzetzes-mps.svg?branch=main)](https://www.travis-ci.com/samcolson4/tzetzes-mps)

[Deployed at www.tzetzes.com](http://www.tzetzes.com)

Tzetzes is a Rails-based full stack application that:
- Displays an aggregated list of MPs' articles, press releases and local news publications against the correct MP.
- Allows users to search through articles and their headlines for keyword(s).

Whilst sounding quite dry (!), this is a radical step forward in terms of quick and easy searching of publications by elected officials that have not previously been catalogued.


## Quickstart

First, clone this repository. Then:

Databases:
```bash
$ brew install postgresql
$ brew services start postgresql
$ psql postgres
```

Rails app:
```bash
$ bundle exec rspec # Run the tests to ensure it works
$ rails db:migrate
$ rails db:seed # This will add in MPs and one test article.
$ rails s #Start the server at localhost:3000
```

In order to add more (real) articles, you have to run a proprietary script. This may be open-sourced in the future.

Demo articles can be added via the 'create' method, where you set up a script to post to localhost:3000/mps/:id/articles using json data as described in the create method. They can also be added directly into the DB.

## Running Tests
From the root folder, run the following command:
```bash
$ bundle exec rspec 
```

## Running Tzetzes
From the root folder, run the following command:
```bash
$ bin/rails server
```
In your browser, navigate to http://localhost:3000/ 

## Technologies

| Area                 | Technology                 |
| -------------------- | -------------------------- |
| Frameworks           | Ruby on Rails              |
| Languages            | Ruby, Javascript, HTML5, CSS3|
| Database             | PostgreSQL                 |
| Hosting              | Heroku / GoDaddy           |
| Testing and Coverage | RSpec, Capybara, Simplecov |
