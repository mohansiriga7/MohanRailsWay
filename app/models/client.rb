=begin
Paranoia is a re-implementation of acts_as_paranoid for Rails 3/4/5, using much, much, much less code.

When your app is using Paranoia, calling destroy on an ActiveRecord object doesn't actually destroy the database record, but just hides it.
Paranoia does this by setting a deleted_at field to the current time when you destroy a record, and hides it by scoping all queries on your model to only include records which do not have a deleted_at field.

If you wish to actually destroy an object you may call really_destroy!. WARNING: This will also really destroy all dependent: :destroy records, so please aim this method away from face when using.

class AddDeletedAtToClients < ActiveRecord::Migration
  def change
    add_column :clients, :deleted_at, :datetime
    add_index :clients, :deleted_at
  end
end
=end


class Client < ActiveRecord::Base
  acts_as_paranoid

  # ...
  def call_to_destroy_sets_deleted_at_column
    #Hey presto, it's there! Calling destroy will now set the deleted_at column:
    client.deleted_at
    # => nil
    client.destroy
    # => client
    client.deleted_at
    # => [current timestamp]
  end

  def call_to_really_destroy!
    #If you really want it gone gone, call really_destroy!:
    client.deleted_at
    # => nil
    client.really_destroy!
    # => client
  end
end
