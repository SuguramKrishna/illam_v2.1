class Property < ActiveRecord::Base
  belongs_to :user
  # searchkick
  validates :prop_name, :prop_type, :room, :sqft, :hsptl_dist, :amount, :address, presence: true
  validates :address, uniqueness: true
end
