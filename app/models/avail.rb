class Avail < ActiveRecord::Base
  has_many :food_times
  accepts_nested_attributes_for :food_times
end
