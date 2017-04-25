class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :icon
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
