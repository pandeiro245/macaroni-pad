# -*r coding: utf-8 -*-
class ApiController < ApplicationController
  def updt_last_tab
    LogAccess.plus({
      :user_id => session[:id],
      :tab => params[:tab],
      #:device => "sp" #TODO
    })
    render :json => true
  end
end
