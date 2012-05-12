class AddImgToTwitter < ActiveRecord::Migration
  def change
    add_column :twitters, :profile_image_url_https, :string
  end
end
