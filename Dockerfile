# Use official Ruby base image
FROM ruby:3.2.2

# Set environment variables
ENV RAILS_ENV=development \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Set working directory
WORKDIR /app

# Install required packages
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*

# Copy Gemfiles and install dependencies
COPY Gemfile* ./
RUN bundle install

# Copy app files
COPY . .

# Precompile assets if needed
# RUN bundle exec rake assets:precompile

# Expose the app port
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
