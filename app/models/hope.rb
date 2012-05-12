# -*r coding: utf-8 -*-
class Hope < ActiveRecord::Base
  attr_accessible :number, :user_id, :hope_body_id
  belongs_to :hope_body
  def self.updt(data, user_id)
    res = true
    (1..5).each do |i|
      if data[i.to_s] != ''
        if hope = Hope.find_or_create_by_number_and_user_id(i, user_id)      
          hb = HopeBody.new({
            :body => data[i.to_s],
            :user_id => user_id,
            :hope_id => hope.id
          })
          hb.save
          hope.hope_body_id = hb.id
          hope.save
        else
          res = false
        end
      end
    end
    res
  end
end
