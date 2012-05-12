class AddUserIdToTwitter < ActiveRecord::Migration
  def change
    add_column :twitters, :user_id, :integer
  end
end
