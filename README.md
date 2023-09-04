# Recipe for good
It's dinner time ! 🍽️
This application helps users find the most relevant recipes that they can prepare with the ingredients that they have at home

**Table of contents**

[[_TOC_]]

## Rails / Ruby version

Current Rails version is 7.0.7.2
Current Ruby version is 3.1.4

## System dependencies

There no dependencies outside of Rails.

## Configuration

### Environnement variables

You have to use a .env file for the application configuration. Duplicate .env.example and customize it to suit your local setup. If you need adjustments for a specific environment, say development, create a .env.development file and override only the needed constants.

#### Rails / Ruby environment

 - `ENVIRONMENT`=development
 - `RAILS_ENV`=development
 - `RAKE_ENV`=development

#### PostgresSQL database settings

 - `DATABASE_HOST`=localhost
 - `DATABASE_USER`=
 - `DATABASE_PASSWORD`=

#### Application setting
 - `HOST` Application host, for url building

## Database creation

To create the database, just run the corresponding rake task:

```
$ bundle exec rails db:create
```

## Database initialization

You can either run the migration or, if you start anew, load the schema

```
$ bundle exec rails db:schema:load
```

## Database seeding

To seed the database, just run the corresponding rake task:

```
$ bundle exec rails db:seed
```

It is also possible to use our custom rake task `rails db:reseed` if you want to drop, create, load and then seed your database

## How to run the test suite

There will be a test suite a bit later

## Services (job queues, cache servers, search engines, etc.)

No services are required.

## Deployment instructions

There will be a CI/CD pipeline a bit later
