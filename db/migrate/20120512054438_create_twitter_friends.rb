class CreateTwitterFriends < ActiveRecord::Migration
  def change
    create_table :twitter_friends do |t|
      t.integer :from_twitter_id
      t.integer :to_twitter_id

      t.timestamps
    end
  end
end
