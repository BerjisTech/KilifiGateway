#!/bin/bash

echo "Clearing Rails cache..."
bundle exec rails runner "Rails.cache.clear"

echo "Clobbering assets..."
bundle exec rake assets:clobber

echo "Clobber webpacker"
bunld exec rake webpacker:clobber

echo "Clearing tmp cache..."
bundle exec rake tmp:cache:clear

echo "Cleaning assets..."
bundle exec rake assets:clean

echo "Clean webpacker"
bundle exec rake webpacker:clean

echo "Compile webpacker"
bundle exec rake webpacker:compile

echo "Precompiling assets..."
bundle exec rake assets:precompile

echo "Rebuild tailwind..."
bundle exec rake tailwindcss:build

echo "Restart Rails server..."
bundle exec rails restart
