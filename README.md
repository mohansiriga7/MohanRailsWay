# MohanRailsWay

a1 = Author.first  
=> #<Author id: 1, name: "mohan siriga", lock_version: 1, created_at: "2017-05-01 15:59:41", updated_at: "2017-05-01 16:00:56"    
a2 = Author.first  
=> #<Author id: 1, name: "mohan siriga", lock_version: 1, created_at: "2017-05-01 15:59:41", updated_at: "2017-05-01 16:00:56">  
a1.name = "mohan s"  
=> "mohan s"  
a1.save  
=> true  
a2.name = "should fail"  
=> "should fail"  
a2.save  
ActiveRecord::StaleObjectError: Attempted to update a stale object: Author  
