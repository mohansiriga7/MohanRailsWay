class Examle < ApplicationRecord

  def before_inverse_of_option
    a = Author.first
    b = a.books.first
    a.first_name == b.author.first_name # => true
    a.first_name = 'Manny'
    a.first_name == b.author.first_name # => false

=begin
    This happens because a and b.author are two different in-memory representations of the same data,
    and neither one is automatically refreshed from changes to the other.
            Active Record provides the :inverse_of option so that you can inform it of these relations:
=end
  end

  def after_inverse_of_option
    a = Author.first
    b = a.books.first
    a.first_name == b.author.first_name # => true
    a.first_name = 'Manny'
    a.first_name == b.author.first_name # => true

=begin
    With inverse_of changes,
    Active Record will only load one copy of the author object, preventing inconsistencies
    and making your application more efficient:

    There are a few limitations to inverse_of support:

      They do not work with :through associations.
      They do not work with :polymorphic associations.
      They do not work with :as associations.
      For belongs_to associations, has_many inverse associations are ignored.
=end
  end

end