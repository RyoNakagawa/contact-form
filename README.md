## Ruby version
- 2.2.3

## Configuration
~~~ sh
bundle install --path vendor/bundle
cp ./config/database.yml.sample ./config/database.yml
cp ./config/secrets.yml.sample ./config/secrets.yml
~~~

## Database creation
~~~ sh
bundle exec rake db:create
~~~

## Database initialization
~~~ sh
bundle exec rake db:migrate
bundle exec rake db:seed
~~~

## How to run the test suite
~~~ sh
bundle exec rspec
~~~

