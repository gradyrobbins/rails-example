FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /myapp
COPY Gemfile* ./
RUN bundle install
RUN yarn install --check-files
COPY . ./

EXPOSE 3000
CMD ["tail", "-f", "/dev/null"]