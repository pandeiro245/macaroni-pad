class Twitter < ActiveRecord::Base
  attr_accessible :name, :screen_name
  VERSION = 1
  def self.updt_via_auth data
    twitter = Twitter.find_or_create_by_id(data[:uid])
    twitter.name = data[:info][:name]
    twitter.screen_name = data[:info][:nickname]
    twitter.profile_image_url_https = data[:info][:image]
    user = User.find_or_create_by_twitter_id twitter.id
    twitter.user_id = user.id
    twitter.save
    self.updt_friends(
      data[:uid],
      data[:credentials][:token],
      data[:credentials][:secret]
    )
    twitter
  end


  def self.updt_friends(id, token, secret)
    url = "/#{VERSION}/friends.json?coursor=-1&count=100&id=#{id}"
    access_token = get_access_token(token, secret)
    begin
      response = access_token.get(url)
    rescue
      return nil
    end
    res = JSON.parse(response.body)
    res['users'].each do |i|
      TwitterFriend.find_or_create_by_from_twitter_id_and_to_twitter_id(id, i['id'])
    end
  end



  def self.get_consumer
    OAuth::Consumer.new(
      'CwNnlOH10VpopMJvgwQUQA', # consumer key
      'yjJLW9t2K0P3wmqOWeGhzx9oyIGRznqE3lPPxeLoIjk', # consumer secret'
      { site: "http://api.twitter.com" }
    )
  end

  def self.get_access_token(token, secret)
    OAuth::AccessToken.new(
      get_consumer,
      token,
      secret
    )
  end
end
