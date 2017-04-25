# MohanRailsWay
for polymorphic association use below migration file

class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end
 
    add_index :pictures, [:imageable_type, :imageable_id]
  end
end






command line:
==employee related images==
pic = Picture.create(name: 'happy face')
=> #<Picture id: 1, name: "happy face", imageable_id: nil, imageable_type: nil> 
emp = Employee.create(name: 'Mohan', picture_name: 'mypic')
=> #<Employee id: 1, name: "Mohan", picture_name: "mypic"> 
pic.update_attribute(:imageable, emp)
=> true 
Employee.last.pictures.last.name
=> "happy face"
Employee.last.pictures.last
=> #<Picture id: 1, name: "happy face", imageable_id: 1, imageable_type: "Employee">


==product related images==
product = Product.create(name: 'AXE Product', picture_name: 'black_pic')
=> #<Product id: 1, name: "AXE Product", picture_name: "black_pic"> 
productPic = Picture.create(name: 'Axe Image')
=> #<Picture id: 2, name: "Axe Image", imageable_id: nil, imageable_type: nil> 
productPic.update_attribute(:imageable, product)
=> true
Product.last.pictures.last.name
=> "Axe Image"
Product.last.pictures.last
=> #<Picture id: 2, name: "Axe Image", imageable_id: 1, imageable_type: "Product">
