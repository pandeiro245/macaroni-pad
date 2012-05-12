class LogAccess < ActiveRecord::Base
  attr_accessible :tab, :user_id
  def self.plus data
    LogAccess.new(data).save
    lau = LogAccessUser.find_or_create_by_user_id(data[:user_id])
    lau.update_attribute('access', lau.access + 1)
  end



end
