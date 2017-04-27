class Employee < ActiveRecord::Base
  belongs_to :office
  delegate :name, :address, to: :office, prefix: true
end
