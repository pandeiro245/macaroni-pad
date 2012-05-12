class AddBodyToHopeBody < ActiveRecord::Migration
  def change
    add_column :hope_bodies, :body, :text
  end
end
