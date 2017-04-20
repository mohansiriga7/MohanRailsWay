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