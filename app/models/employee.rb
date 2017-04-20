class Employee < ActiveRecord::Base
  belongs_to :office
  delegate_belongs_to :office

  def without_delegate_belongs_to
    #If you want to find out the address of an employee you would have to do the following:

    emp.office.address
    #=> "Edinburgh"
  end

  def with_delegate_belongs_to
    #you would get direct access to the attributes of the Office model:

    emp.address
    #=> "Edinburgh"
  end

end