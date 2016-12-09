# Chef Zero
#
# VERSION 3.0.1
FROM iidlx/ruby:2.2
MAINTAINER DLX

COPY . /home/chef

WORKDIR /home/chef

RUN chmod +x /home/chef/entrypoint.sh

RUN gem install chef-zero
RUN gem install chef-dk
RUN gem install berkshelf

ENTRYPOINT ["/home/chef/entrypoint.sh"]
