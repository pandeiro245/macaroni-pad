# -*r coding: utf-8 -*-
class HopesController < ApplicationController
  def updt
    @res = {}
    if Hope.updt(params, session[:id])
      @res['msg'] = "「毎日やる事」を更新しました"
    else
      @res['msg'] = "システムエラーが発生しました"
    end
    render :json => @res
  end
end
