class PaymentDetail < ActiveRecord::Base
  belongs_to :users
  belongs_to :properties
end
