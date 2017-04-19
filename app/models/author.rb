class Author < ApplicationRecord
  #shas_many :books
  has_many :books, inverse_of: :author
end