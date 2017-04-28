module AliasMethod
  class Vehicle < ActiveRecord::Base

    def engine_name
      puts "vehicle engine"
    end

    def self.add_rename
      #alias :name :engine_name
      alias_method :name, :engine_name
    end

  end
end