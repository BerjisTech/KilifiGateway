echo "Setting environment"
bundle exec rake db:environment:set RAILS_ENV=development

echo "Dropping databases"
bundle exec rake db:drop --trace

echo "Creating databases"
bundle exec rake db:create --trace

echo "Migrating databases"
bundle exec rake db:migrate --trace

echo "Seeding databases"
bundle exec rake db:seed --trace