class CreateHopes < ActiveRecord::Migration
  def change
    create_table :hopes do |t|
      t.string :user_id
      t.date :date_on

      t.timestamps
    end
  end
end
