# -*r coding: utf-8 -*-
class HopesController < ApplicationController
  def viewer
    hopes = Hope.where(:user_id => session[:id])
    @res = {
      :hopes => {},
      :hope_dailies => {}
    }
    hopes.each do |i|
      @res[:hopes][i.number] = i.hope_body.body if i.hope_body.body
    end
    hopes.each do |i|
      hd = HopeDaily.where(
        :date_on => Time.now.to_date,
        :hope_id => i.id,
        :is_done => true
      )
      @res[:hope_dailies][i.number] = true if hd[0]
    end
    render :json => @res
  end

  def updt
    @res = {}
    if Hope.updt(params, session[:id])
      @res['msg'] = "「毎日やる事」を更新しました"
    else
      @res['msg'] = "システムエラーが発生しました"
    end
    render :json => @res
  end


  def done_daily
    @res = {}
    if HopeDaily.updt('done', params, session[:id])
      @res['msg'] = "完了させました！"
    else
      @res['msg'] = "システムエラーが発生しました"
    end
    render :json => @res
  end

  def cancel_daily
    @res = {}
    if HopeDaily.updt('cancel', params, session[:id])
      @res['msg'] = "完了を復帰させました"
    else
      @res['msg'] = "システムエラーが発生しました"
    end
    render :json => @res
  end

end
