class CreateUserHopes < ActiveRecord::Migration
  def change
    create_table :user_hopes do |t|
      t.integer :user_id
      t.integer :hope_id

      t.timestamps
    end
  end
end
