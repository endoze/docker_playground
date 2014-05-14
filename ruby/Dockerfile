FROM playground/base
MAINTAINER Chris Stephan <cstephan@squaremouth.com>

RUN apt-get install -y autoconf \
      libpq-dev \
      libsqlite3-dev \
      libmysqlclient-dev \
      zlib1g-dev \
      libssl-dev \
      libreadline-dev \
      libyaml-dev \
      libxml2-dev \
      libxslt-dev

RUN git clone https://github.com/sstephenson/rbenv.git .rbenv && \
    echo 'export PATH="/.rbenv/bin:$PATH"' >> .bash_profile

RUN git clone https://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build

ENV PATH /.rbenv/shims:/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >  .bash_profile

RUN /.rbenv/bin/rbenv install 2.1.0

RUN /.rbenv/bin/rbenv global 2.1.0 && /.rbenv/bin/rbenv rehash
