class CreateLogAccesses < ActiveRecord::Migration
  def change
    create_table :log_accesses do |t|
      t.integer :user_id
      t.string :tab

      t.timestamps
    end
  end
end
