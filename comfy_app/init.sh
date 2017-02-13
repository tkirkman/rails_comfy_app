#!/bin/sh
set -x

# wait for postgresql
until nc -vz db 5432; do
  echo "Postgresql is not ready, sleeping..."
  sleep 2
done
echo "Postgresql is ready, starting Rails."
sleep 1
echo "Creating Postgresql Database"
RAILS_ENV=development bundle exec rake db:create
echo "Running DB Migrations"
RAILS_ENV=development bundle exec rake db:migrate
echo "Starting Rails Webserver"
RAILS_ENV=development bundle exec rails s -p 3000 -b '0.0.0.0'
#echo "Importing CMS Fixtures"
#rake comfortable_mexican_sofa:fixtures:import FROM=templates TO=comfy-example-site
