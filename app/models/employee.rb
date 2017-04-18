class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee",
           foreign_key: "manager_id"

  belongs_to :manager, class_name: "Employee"
end


=begin
In designing a data model, you will sometimes find a model that should have a relation to itself.
For example, you may want to store all employees in a single database model, but be able to trace
relationships such as between manager and subordinates. This situation can be modeled with self-joining associations:

In your migrations/schema, you will add a references column to the model itself.
class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :manager, index: true
      t.timestamps
    end
  end
end=end
