# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  <p>3.1.2</p>

* System dependencies

* Configuration
```
  config/database.yml.example
  
  
  default: &default
    adapter: postgresql
    encoding: unicode
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

  development:
    <<: *default
    database: bbq_development
  
  test:
    <<: *default
    database: bbq_test

  production:
    <<: *default
    host: localhost
    port: 5432
    database: bbq_prod
    username: <username>
    password: <password>
```

* Database creation

```
  rails db:create
```
* Database initialization

```
rails db:migrate
```

Generate a new encrypted credentials file: 

```
EDITOR=vim rails credentials:edit (Note: You may need to adopt this. Never forget to set the EDITOR env variable)
```
