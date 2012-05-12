class LogAccessUser < ActiveRecord::Base
  attr_accessible :access, :user_id
end
