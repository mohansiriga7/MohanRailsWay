module AliasMethod
  class Car < Vehicle
    def engine_name
      puts "car engine"
    end
    add_rename
  end
end