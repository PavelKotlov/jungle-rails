# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

![Home Page](https://user-images.githubusercontent.com/107829745/231652974-59ed2e1e-b31b-487b-98bf-2dbf4eb68595.JPG)
![Admin Page](https://user-images.githubusercontent.com/107829745/231652978-8cfa8117-3d91-4ab2-b757-4b73ccdc80e6.JPG)
![Cart Page](https://user-images.githubusercontent.com/107829745/231652979-5c983224-8ede-47f1-bc86-0b65ccafd122.JPG)
![Product Selection](https://user-images.githubusercontent.com/107829745/231653553-bb97ce45-0684-4408-96a0-cfca8ad9fcbc.JPG)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
