FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
RUN rm -rf /myapp/tmp/
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Start the main process.
USER root
EXPOSE 3000
CMD ["sh", "-c", "bundle exec rails db:migrate; bundle exec rails server -b 0.0.0.0"]
