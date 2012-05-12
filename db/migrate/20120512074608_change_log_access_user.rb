class ChangeLogAccessUser < ActiveRecord::Migration
  def change
    change_column :log_access_users, :access, :integer, {:default => 0}
  end
end
