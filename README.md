# Recipe for good
It's dinner time ! 🍽️<br>
This application helps users find the most relevant recipes that they can prepare with the ingredients that they have at home

## Rails / Ruby version

Current Rails version is 7.0.7.2<br>
Current Ruby version is 3.1.4

## React version

Current React version is 18.2.0

## System dependencies

There no dependencies outside of Rails & React.

## Configuration

### Environnement variables

You have to use a `.env` file for the application configuration. Duplicate `.env.example` and customize it to suit your local setup. If you need adjustments for a specific environment, say development, create a `.env.development` file and override only the needed constants.

#### Rails / Ruby environment

 - `ENVIRONMENT`=development
 - `RAILS_ENV`=development
 - `RAKE_ENV`=development

#### React environment

 - `VITE_API_URL`=http://localhost:3000/api/v1

#### PostgresSQL database settings

 - `DATABASE_HOST`=localhost
 - `DATABASE_USER`=
 - `DATABASE_PASSWORD`=

#### Application setting
 - `HOST`=http://127.0.0.1:5173

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

Run the test suite with Rspec:

```
$ bundle exec rspec spec
```

## Services (job queues, cache servers, search engines, etc.)

No services are required.

## Deployment instructions

There is a CI/CD pipeline that:
- runs Rspec tests for each individual PR
- deploy our app to our fly.io when merging on `main` branch

