FROM ruby:2.3.3-slim
 
# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mysql-client libmysqlclient-dev
 
# Define where our application will live inside the image
ENV RAILS_ROOT /var/www/portfolio
 
# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids
 
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
 
# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile
 
COPY Gemfile.lock Gemfile.lock
 
# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler
 
# Finish establishing our Ruby enviornment
RUN bundle install
 
# Copy the Rails application into place
COPY . .
 
# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
RUN chmod +x config/containers/app_cmd.sh
CMD [ "config/containers/app_cmd.sh" ]