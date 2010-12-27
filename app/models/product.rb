class Product < ActiveRecord::Base
	validates_presence_of :title, :description, :image_url
	validates_numerically_of :price
end
