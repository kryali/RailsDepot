class AddTestData < ActiveRecord::Migration
  def self.up
	Product.delete_all
	Product.create(:title => "Dell M1530", :description => %{Well used dell m1530},
					:image_url => '/images/svn.jpg',
					:price => 140.0)
	Product.create(:title => "Used Soul", :description => %{Slightly used soul of a college student},
					:image_url => '/images/soul.jpg',
					:price => 10.0)
  end

  def self.down
	Product.delete_all
  end
end
