class Account < ActiveRecord::Base
  has_one :picture
  accepts_nested_attributes_for :picture
end
