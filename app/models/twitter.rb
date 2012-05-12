class Twitter < ActiveRecord::Base
  attr_accessible :name, :screen_name
  def self.updt_via_auth data
    twitter = Twitter.find_or_create_by_id(data[:uid])
    twitter.name = data[:info][:name]
    twitter.screen_name = data[:info][:nickname]
    twitter.profile_image_url_https = data[:info][:image]
    user = User.find_or_create_by_twitter_id twitter.id
    twitter.user_id = user.id
    twitter.save
    twitter
  end
end
