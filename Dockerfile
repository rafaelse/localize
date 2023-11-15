FROM ruby:2.6.5-alpine

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
        postgresql-dev \
        shared-mime-info \
        imagemagick

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["sh", "/app/entrypoint.sh"]