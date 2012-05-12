class UpdtHope < ActiveRecord::Migration
  def change
    add_column :users, :max_combo, :integer
    add_column :hopes, :number, :integer
    remove_column :hopes, :date_on
    remove_column :user_hopes, :is_done
    rename_table :user_hopes, :hope_bodies
    
    create_table :hope_dailies do |t|
      t.date :date_on
      t.integer :hope_id
      t.boolean :is_done
    end
    
    create_table :user_dailies do |t|
      t.date :date_on
      t.integer :done_n
    end


  end
end
