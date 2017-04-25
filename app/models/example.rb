#One-to-one
module Example1
  class Member < ActiveRecord::Base
    has_one :avatar
    accepts_nested_attributes_for :avatar

    def creates_the_member_and_avatar_in_one_go
      params = { member: { name: 'Jack', avatar_attributes: { icon: 'smiling' } } }
      member = Member.create(params[:member])
      member.avatar.id # => 2
      member.avatar.icon # => 'smiling'
    end

    def updates_the_avatar_through_the_member
      params = { member: { avatar_attributes: { id: '2', icon: 'sad' } } }
      member.update params[:member]
      member.avatar.icon # => 'sad'
    end
  end
end
#One-to-one with allow_destroy option
module Example2
  class Member < ActiveRecord::Base
    has_one :avatar
    accepts_nested_attributes_for :avatar, allow_destroy: true

    def destroy_the_associated_model
      member.avatar_attributes = { id: '2', _destroy: '1' }
      member.avatar.marked_for_destruction? # => true
      member.save
      member.reload.avatar # => nil
    end
  end
end
#One-to-many
module Example2
  class Member < ActiveRecord::Base
    has_many :posts
    accepts_nested_attributes_for :posts
=begin
    You can now set or update attributes on the associated posts through an attribute hash for a member:
    include the key :posts_attributes with an array of hashes of post attributes as a value.
    For each hash that does not have an id key a new record will be instantiated,
    unless the hash also contains a _destroy key that evaluates to true.
=end

    def creates_the_member_and_posts_in_one_go
      params = { member: {
          name: 'joe', posts_attributes: [
              { title: 'Kari, the awesome Ruby documentation browser!' },
              { title: 'The egalitarian assumption of the modern citizen' },
              { title: '', _destroy: '1' } # this will be ignored
          ]
      }}

      member = Member.create(params[:member])
      member.posts.length # => 2
      member.posts.first.title # => 'Kari, the awesome Ruby documentation browser!'
      member.posts.second.title # => 'The egalitarian assumption of the modern citizen'
    end
  end
end
