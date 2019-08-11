# Product Reviews

#### Author: Ben Martinson

## Description

This is a rails crud application that models a food specialty online store, where admins can manipulate products (full crud), and users can leave reviews.

## Setup/Installation Requirements

* Clone the repository
* Navigate to project directory using cd in terminal
* Install ruby and rails globally (gem install rails inside root directory)
* Use'bundle install' to load the Gems from the Gemfile
* Start a postgres server in the background
* Create the psql database from backup, with the following commands:
    ```
    createdb product_review_development
    psql product_review_development < database_backup.sql
    ```
* To run the program, use 'rails start'
* Open a web browser and navigate to the url: http://localhost:3000

## Support and contact details

If you find a bug, run into any issues, please email benmartinson92@gmail.com

## Technologies Used

* Ruby
* RubyGems
* Rails
* Postgres

### License

MIT License
Copyright (c) 2019 Benjamin Martinson
