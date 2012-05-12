class AddHopeBodyIdToHope < ActiveRecord::Migration
  def change
    add_column :hopes, :hope_body_id, :integer
  end
end
