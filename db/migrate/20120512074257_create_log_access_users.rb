class CreateLogAccessUsers < ActiveRecord::Migration
  def change
    create_table :log_access_users do |t|
      t.integer :user_id
      t.integer :access

      t.timestamps
    end
  end
end
