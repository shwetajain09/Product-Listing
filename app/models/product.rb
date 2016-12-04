class Product < ActiveRecord::Base
	validates_presence_of :name, :description, :price
	validates_numericality_of :price
end
