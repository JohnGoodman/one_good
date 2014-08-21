class NeedCategory < ActiveRecord::Base
  belongs_to :need
  belongs_to :category
end
