FROM ruby:2.6.1

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -


RUN apt-get --ignore-missing install build-essential openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev libffi-dev software-properties-common libgdm-dev libncurses5-dev automake autoconf libtool bison libc6-dev imagemagick --fix-missing libmagickcore-dev libmagickwand-dev nodejs -y


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN gem install bundler -v 1.16.1
RUN gem install rails -v '5.2.3'

COPY . /myapp
WORKDIR /myapp

RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]