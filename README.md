Ignite San Diego
================

This is the web application that runs Ignite San Diego.

Heroku + Sinatra + Twitter gem = crazy delicious.

## Getting started

### Clone the app
1. `cd Sites/` (or wherever you like to store projects locally)
2. `git clone git@github.com:mokolabs/ignitesandiego.git ignitesandiego`

### Configure the app and bundle install
1. Add Heroku remote: `heroku git:remote -a ignitesandiego`
2. Switch to Ruby 2.1.2 with the Ruby version manager of your choice (this
should happen automatically from the .ruby-version file)
3. `bundle install`

### Launch the app
1. Run `bundle exec foreman start` to launch the app.
