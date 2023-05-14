<h1 align="center">Jungle</h1>

#### 🔗 Jungle
A mini e-commerce application built with Rails 6.1. Jungles allows a consumer to add and remove products from a cart. In addition the shop owner can create new categories of products, and add new products to each caterogry. Finally the consumer can sum their order and checkout using stripe's api to process the payment.

[![made-with-Node](https://img.shields.io/badge/Made%20with-Node.js%20-success)](https://nodejs.org/en/)
[![made-with-Ruby](https://img.shields.io/badge/Made%20with-Ruby%20-red)](https://www.ruby-lang.org/en/)
[![made-with-Rails](https://img.shields.io/badge/Made%20with-Rails%20-red)](https://rubyonrails.org/)
[![made-with-PostgreSQL](https://img.shields.io/badge/Made%20with-PostgreSQL%20-blue)](https://www.postgresql.org/)
[![made-with-Bootstrap](https://img.shields.io/badge/Made%20with-Bootstrap%20-purple)](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
[![made-with-Stripe](https://img.shields.io/badge/Made%20with-Stripe%20-success)](https://stripe.com/docs/api)
[![made-with-Webpack](https://img.shields.io/badge/Made%20with-Webpack%20-success)](https://webpack.js.org/)
[![made-with-Cypress](https://img.shields.io/badge/Made%20with-Cypress%20-success)](https://www.cypress.io/)

## Table of Content
- [🔗 Jungle](#-jungle)
- [Table of Content](#table-of-content)
- [🌟 Features](#-features)
- [🚀 Getting Started](#-getting-started)
  - [Database](#database) 
  - [Stripe Testing](#stripe-testing)
- [⚫ Endpoints](#-endpoints)
- [🧱 Main Structure](#-main-structure)
- [📦 Tech Stack (Dependencies)](#-tech-stack-dependencies)
  - [🔨 Dependencies](#-Dependencies)
  - [🧰 Development Dependencies](#-development-dependencies)
- [⚠️ Disclaimer](#️-disclaimer)

## 🌟 Features
- A consumer can browse, view, and add to cart a number of proudcts from different categories.
- A consumer can pay for their order and recieve an order summary.
- A store owner can view a dashboard which shows the number of categories, products, and sales currently in their store.
- A store owner can add or delete sales, catergories, and proudcts to and from their store.
- A store owner would need to authenticate before being able to access sensitive areas such as thier dashboard.

<div align="center">
  <h3>Purchase Feature</h3>
  <img alt="purchase" src="https://github.com/PavelKotlov/jungle-rails/assets/107829745/7861103d-6c06-4ce2-b1e6-d2b86646f46c" width="512:288"/>
</div>
<div align="center">
   <h3>Admin Features</h3>
  <img alt="admin" src="https://github.com/PavelKotlov/jungle-rails/assets/107829745/7bb8f4bc-5f54-4661-a5c1-9d2a35b0bf6a" width="512:288"/>
</div>
<div align="center">
   <h3>Sale Feature</h3>
  <img alt="sale" src="https://github.com/PavelKotlov/jungle-rails/assets/107829745/82f9c02e-9514-4fb2-9afe-d5bda0270813" width="512:288"/>
</div>

## 🚀 Getting Started
1. Fork and clone the repository.
2. Install all dependencies using the `bundle install` command[^1].
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rails db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. Visit http://127.0.0.1:3000 or [localhost:3000](http://localhost:3000) in your browser (port defaults to 3000).
11. To authenticate user use `Jungle` and `book` when prompted.

### Database

  - If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

### Stripe Testing

  - Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. More information in the [stripe docs](https://stripe.com/docs/testing#cards)

## ⚫ Endpoints
- Base URL : http://127.0.0.1:3000

| <b> Http method </b> | path                             | Description                                    |
| :------------------: | :------------------------------: | :---------------------------------------------:|
| `GET`                | `/`                              | products#index                                 |
| `GET`                | `/login`                         | sessions#new                                   |
| `POST`               | `/login`                         | sessions#create                                |
| `GET`                | `/logout`                        | sessions#destroy                               |
| `GET`                | `/signup`                        | users#new                                      |
| `POST`               | `/users`                         | users#create                                   |
| `GET`                | `/admin`                         | admin/dashboard#show                           |
| `GET`                | `/admin/products`                | admin/products#index                           |
| `POST`               | `/admin/products`                | admin/products#create                          |
| `GET`                | `/admin/products/new`            | admin/products#new                             |
| `DELETE`             | `/admin/products/:id`            | admin/products#destroy                         |
| `GET`                | `/admin/categories`              | admin/categories#index                         |
| `POST`               | `/admin/categories`              | admin/categories#create                        |
| `GET`                | `/admin/categories/new`          | admin/categories#new                           |
| `DELETE`             | `/admin/categories/:id`          | dmin/categories#destroy                        |
| `GET`                | `/admin/sales`                   | admin/sales#index                              |
| `POST`               | `/admin/sales`                   | admin/sales#create                             |
| `GET`                | `/admin/sales/new`               | admin/sales#new                                |
| `DELETE`             | `/admin/sales/:id`               | admin/sales#destroy                            |
| `GET`                | `/about`                         | about#index                                    |
| `GET`                | `/products`                      | products#index                                 |
| `GET`                | `/products/:id`                  | products#show                                  |
| `GET`                | `/categories/:id`                | categories#show                                |
| `POST`               | `/orders`                        | orders#create                                  |
| `GET`                | `/orders/:id`                    | orders#show                                    |
| `POST`               | `/users`                         | users#create                                   |
| `GET`                | `/users/new`                     | users#new                                      |
| `POST`               | `/cart/add_item`                 | carts#add_item                                 |
| `POST`               | `/cart/remove_item`              | carts#remove_item                              |
| `GET`                | `/cart`                          | carts#show                                     |

## 🧱 Main Structure
```sh
├─── .github               
├─── app            
├─── bin             
├─── config              
├─── cypress             
├─── db
├─── lib
├─── log
├─── public
├─── spec
├─── storage
├─── test
├─── tmp
├─── vendor
├─── .browserlistrc
├─── .env.example
├─── .gitignore
├─── .ruby-version
├─── Gemfile
├─── Gemfile.lock
├─── README.md
├─── Rakefile
├─── babel.config.js
├─── config.ru
├─── cypress.json
├─── package-lock.json
├─── package.json
└─── postcss.config.js
```

## 📦 Tech Stack (Dependencies)

### 🔨 Dependencies
- [@rails/actioncable](https://www.npmjs.com/package/@rails/actioncable/v/6.0.0)
- [@rails/activestorage](https://www.npmjs.com/package/@rails/activestorage/v/6.0.0)
- [@rails/ujs](https://www.npmjs.com/package/@rails/ujs/v/6.0.0)
- [@rails/webpacker](https://www.npmjs.com/package/@rails/webpacker/v/5.4.0)
- [turbolinks](https://www.npmjs.com/package/turbolinks/v/5.2.0)
- [webpack](https://www.npmjs.com/package/webpack/v/4.46.0)
- [webpack-cli](https://www.npmjs.com/package/webpack-cli/v/3.3.12)

### 🧰 Development Dependencies
- [Cypress](https://www.npmjs.com/package/cypress/v/9.7.0)
- [Webpack-dev-server](https://www.npmjs.com/package/webpack-dev-server/v/3.11.2)

## ⚠️ Disclaimer
- This is a project for [LHL web development bootcamp](https://www.lighthouselabs.ca/) and is not meant for production use.

---
[^1]: If running this command fails due to rmagick unable to install, then run this command `sudo apt-get install libmagickwand-dev imagemagick` and then repeat step 2.
