FROM ruby:2.6.5-alpine

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV APP_HOME /app
ENV BUNDLE_APP_CONFIG="$APP_HOME/.bundle"
ENV BUNDLER_VERSION=2.3.26

RUN apk add --update --no-cache \
        binutils-gold \
        build-base \
        curl \
        file \
        g++ \
        gcc \
        git \
        less \
        libstdc++ \
        libffi-dev \
        libc-dev \
        linux-headers \
        libxml2-dev \
        libxslt-dev \
        libgcrypt-dev \
        make \
        netcat-openbsd \
        nodejs \
        openssl \
        pkgconfig \
        postgresql \
        postgresql-dev \
        shared-mime-info \
        imagemagick

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./

RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
RUN bundle config --local build.sassc --disable-march-tune-native
RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]

