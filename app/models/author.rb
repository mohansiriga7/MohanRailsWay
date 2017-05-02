class Author < ActiveRecord::Base
  def validate!
    errors.add(:name, :blank, message: "cannot be nil") if name.nil?
  end

  def show_errors
    errors.each do |error|
      puts error
    end
  end
end
