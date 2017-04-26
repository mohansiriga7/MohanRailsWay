class AddDeletedAtColumnToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :deleted_at, :datetime
  end
end
