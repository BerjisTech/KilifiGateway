# Use an official Ruby runtime as a parent image
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory in the image to /app
WORKDIR /app

# Add the Gemfile and Gemfile.lock to app directory
COPY Gemfile Gemfile.lock ./

# Install bundle
RUN bundle install

# Add the whole app
COPY . .

# Expose the port
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
