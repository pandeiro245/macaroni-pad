class TwitterFriend < ActiveRecord::Base
  attr_accessible :from_twitter_id, :to_twitter_id
end
