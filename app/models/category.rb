class Category < ActiveRecord::Base
	has_many :need_categories
	has_many :needs, through: :need_categories
end
