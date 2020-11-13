FROM ruby
RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*

WORKDIR /apps
COPY Gemfile /apps/Gemfile
RUN bundle install 

ADD https://api.github.com/repos/euikook/gollum/git/refs/heads/master version.json
RUN git clone https://github.com/euikook/gollum.git && \
cd gollum && \
gem build gollum.gemspec && gem install gollum-*.gem && rm -rf /apps/gollum
    
CMD ["unicorn", "-c", "unicorn.rb"]
EXPOSE 80
