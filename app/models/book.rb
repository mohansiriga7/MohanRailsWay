class Book < ApplicationRecord
  #belongs_to :author
  belongs_to :author, inverse_of: :books
end