# 1: Use ruby 1.9.3 as base:
FROM ruby:1.9.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 2: We'll set the application path as the working directory
WORKDIR /usr/src/app

# 3: We'll set the working dir as HOME and add the app's binaries path to $PATH:
ENV HOME=/usr/src/app PATH=/usr/src/app/bin:$PATH

# 7: Install the current project gems - they can be safely changed later during
# development via `bundle install` or `bundle update`:
ADD Gemfile* /usr/src/app/

RUN set -ex && bundle update --jobs 2 --retry 3