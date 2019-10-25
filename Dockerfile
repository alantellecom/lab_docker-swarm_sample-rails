FROM ruby:2.6.1

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -


RUN apt-get --ignore-missing install build-essential netcat  imagemagick  --fix-missing libmagickcore-dev libmagickwand-dev nodejs -y


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN gem install bundler -v 1.16.1
RUN gem install rails -v '5.2.3'
RUN mkdir -p /myapp
RUN chmod -R 777 /myapp
WORKDIR /myapp

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp/
RUN ["chmod", "+x", "/myapp/wait-for"]
RUN chmod -R 777 /myapp

RUN bin/rails assets:precompile RAILS_ENV=production

CMD ["bin/rails", "s", "-b", "0.0.0.0", "-e", "production"]