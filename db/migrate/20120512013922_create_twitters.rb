class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :screen_name
      t.string :name

      t.timestamps
    end
  end
end
