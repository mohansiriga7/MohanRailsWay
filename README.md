# MohanRailsWay

author = Author.new  
 => #<Author id: nil, name: nil, lock_version: 0, created_at: nil, updated_at: nil>  
author.validate!  
 => ["cannot be nil"]  
author.errors.full_messages  
 => ["Name cannot be nil"]  
mohan = Author.new(name: "mohan siriga")  
 => #<Author id: nil, name: "mohan siriga", lock_version: 0, created_at: nil, updated_at: nil>  
mohan.validate!  
 => nil  
mohan.errors.full_messages  
 => []  
