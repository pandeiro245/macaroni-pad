#_ -*r coding: utf-8 -*-
class TwittersController < ApplicationController
  def login
    @auth = request.env["omniauth.auth"]
    session[:oauth] = @auth[:credentials]
    session[:twitter_id] = @auth[:uid]
    twitter = Twitter.updt_via_auth(@auth)
    session[:id]  = twitter.user_id
    session[:twitter_id]  = twitter.id
    redirect_to '/'
  end

  def logout
    session.destroy
    session = nil
    redirect_to '/'
  end
end
