# README

# SHIPMENTS TRACKER
## Production app URL

    http://shipments_tracker.com/

Things you may want to cover:

## System Requeriments

- Ruby 3.0.0
- Rails 7.0.6
- PostgreSQL

## Dependencies

### Ruby
    bundle install

## Database Management

To setup database you either run:

    rails db:setup

or:

    rails db:create
    rails db:migrate
    rails db:seed

### Running migrations

to run migrations use the following command:

    rails db:migrate

## Development

### Configure environment variables
1. Copy .env.example
2. Rename it from

        env copy.example to .env
3. Fill the value of the variables
(You can ask them from the technical leader)

### Running the rails server
    rails server

## Tests
You should run the tests with the following command:

    rails test