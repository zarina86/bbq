# BBQ

BBQ is application which allows to create events, upload photos, comment and subscribe.

## Before installation:
Install Ruby by following the instructions [link](https://www.ruby-lang.org/en/documentation/installation/).

Ruby version:   ```3.1.2```

Rails version: ```7.0.4```

## Installation:

Clone repository to your computer:

    git clone git@github.com:zarina86/bbq.git bbq

Move to the project directory:

    cd bbq

Run bundler command to install dependencies:

    bundle install

Database creation

    rails db:create
  

Database initialization

    rails db:migrate


Generate a new encrypted credentials file: 

    EDITOR=nano rails credentials:edit 

or 

    EDITOR="code --wait"  rails credentials:edit 

You can also generate new  new encrypted credentials file for environments:

    EDITOR="code --wait"  rails credentials:edit  --environment=production
    
 ## Project technologies:
 
 * Active Storage - AWS S3
 
 * Action Mailer - Mailjet
 
 * Active Record - Postgresql
 
 * Authentication - Devise, Omniauth VK and Gitthub
 
 * Authorization - Pundit
 
 * CSS - Bootstrap 5, custom styles
 
 * Javascript - JQuery, third-party library
 
 * I18n, DeviseI18n for localization
 
 * Capistrano - automated deployment scripts
 
 * Redis (resque) - email sending delayed jobs
 
 * Rspec - event policy test
 
 
 
 
 
 
 
 
 
 



