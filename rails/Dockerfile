FROM playground/ruby
MAINTAINER Chris Stephan <cstephan@squaremouth.com>

RUN gem install rails --no-ri --no-rdoc && /.rbenv/bin/rbenv rehash
RUN rails new docker_rails
RUN apt-get install -y nodejs mysql-client
RUN sed -i -e"s/sqlite3/mysql2/" docker_rails/Gemfile
ADD database.yml docker_rails/config/database.yml
ADD run-rails.sh /run-rails.sh
RUN chmod +x /run-rails.sh
RUN cd docker_rails && bundle install

EXPOSE 3000

CMD ["/run-rails.sh"]
