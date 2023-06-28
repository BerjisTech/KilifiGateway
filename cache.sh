#!/bin/bash

echo "Removing node modules..."
rm -rf -v node_modules

echo "Removing yarn lock..."
rm yarn.lock

echo "Clearing Rails cache..."
bundle exec rails runner "Rails.cache.clear" --trace

echo "Clobbering assets..."
bundle exec rake assets:clobber --trace

echo "Clobbering webpacker..."
bunld exec rake webpacker:clobber --trace

echo "Clearing tmp cache..."
bundle exec rake tmp:cache:clear --trace

echo "Cleaning assets..."
bundle exec rake assets:clean --trace

echo "Cleaning webpacker..."
bundle exec rake webpacker:clean --trace

echo "Installing yarn..."
yarn install --check-files --fix-missing --force --trace

echo "Compiling webpacker..."
bundle exec rake webpacker:compile --trace

echo "Precompiling assets..."
bundle exec rake assets:precompile --trace

echo "Rebuilding tailwind..."
bundle exec rake tailwindcss:build --trace

echo "Restarting Rails server..."
bundle exec rails restart --trace
