# -*r coding: utf-8 -*-
class HopeDaily < ActiveRecord::Base
  attr_accessible :date_on, :hope_id, :is_done
  def self.updt(type, data, user_id)
    res = true
    hope = Hope.find_by_number_and_user_id(data[:hope_number], user_id)
    hd = HopeDaily.find_or_create_by_date_on_and_hope_id(Time.now.to_date, hope.id)
    if type == "done"
      hd.is_done = true
    elsif type="cancel"
      hd.is_done = false
    end
    if hd.save
      res = true
    else
      res = false
    end
  end
end
