FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*

WORKDIR /apps
COPY Gemfile /apps/Gemfile
RUN bundle install 
RUN git clone https://github.com/euikook/gollum.git && \
cd gollum && \
gem build gollum.gemspec && gem install gollum-*.gem
    
CMD ["unicorn", "-c", "unicorn.rb"]
EXPOSE 80
