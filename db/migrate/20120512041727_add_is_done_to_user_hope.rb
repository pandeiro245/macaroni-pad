class AddIsDoneToUserHope < ActiveRecord::Migration
  def change
    add_column :user_hopes, :is_done, :boolean
  end
end
