class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :engine_name

      t.timestamps null: false
    end
  end
end
