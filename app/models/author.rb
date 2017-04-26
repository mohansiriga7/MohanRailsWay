class Author < ActiveRecord::Base
  acts_as_paranoid

  has_many :books
end
