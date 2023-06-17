#!/bin/bash

echo "Clearing Rails cache..."
bundle exec rails runner "Rails.cache.clear"

echo "Clobbering assets..."
bundle exec rake assets:clobber

echo "Clearing tmp cache..."
bundle exec rake tmp:cache:clear

echo "Cleaning assets..."
bundle exec rake assets:clean

echo "Precompiling assets..."
bundle exec rake assets:precompile

echo "Stopping Rails server..."
kill -9 $(cat tmp/pids/server.pid)

echo "Start Rails server..."
bundle exec rails s
