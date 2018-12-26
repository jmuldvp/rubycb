# bsearch which is O(log n)

# I'm guessing this logs how many iterations it takes before the req is satisfied.
ary = [0, 4, 7, 10, 12]
puts (0...ary.size).bsearch {|i| ary[i] >= 4 } # => 1
puts (0...ary.size).bsearch {|i| ary[i] >= 6 } # => 2
puts (0...ary.size).bsearch {|i| ary[i] >= 8 } # => 3
puts (0...ary.size).bsearch {|i| ary[i] >= 100 } # => nil

# Exception#cause method keeps track of the root cause of your errors. In previous
# versions, this would've thrown a "method doesn't exist" error.

# begin
#   require 'does_not_exist'
# rescue
#   nil.some_method
# end

# LoadError: cannot load such file -- does_not_exist

# Gaining knowledge into the garbage collector is a nice capability..
require 'pp'
puts pp GC.stat

# {:count=>8,
#  :heap_allocated_pages=>132,
#  :heap_sorted_length=>133,
#  :heap_allocatable_pages=>4,
#  :heap_available_slots=>53801,
#  :heap_live_slots=>46846,
#  :heap_free_slots=>6955,
#  :heap_final_slots=>0,
#  :heap_marked_slots=>9056,
#  :heap_swept_slots=>35599,
#  :heap_eden_pages=>128,
#  :heap_tomb_pages=>4,
#  :total_allocated_pages=>132,
#  :total_freed_pages=>0,
#  :total_allocated_objects=>114982,
#  :total_freed_objects=>68136,
#  :malloc_increase_bytes=>586976,
#  :malloc_increase_bytes_limit=>16777216,
#  :minor_gc_count=>5,
#  :major_gc_count=>3,
#  :remembered_wb_unprotected_objects=>60,
#  :remembered_wb_unprotected_objects_limit=>300,
#  :old_objects=>8499,
#  :old_objects_limit=>13872,
#  :oldmalloc_increase_bytes=>1726464,
#  :oldmalloc_increase_bytes_limit=>16777216}

# Another helper that comes in handy is Kernel#dir instead of just Kernel#FILE
puts __dir__

# ~/code/rubycb/chapt1


# another little helper that is useful is Kernel#require_relative, which allows you to
# require a local Ruby file:

# old way
require File.expand_path(
  File.join(File.dirname(__FILE__), "..", "lib", "mylib")
)

# new way with __dir__
require File.expand_path(
  File.join(__dir__, "..", "lib", "mylib")
)

# new way with require_relative
require_relative File.join("..", "lib", "mylib")

# For network admins who need network information
require 'socket'
require 'pp'

pp Socket.getifaddrs

#<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST LINK[lo0]>,
#<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST ::1 netmask=ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>,

# Example of Enumerable#chunk
"the quick brown fox".each_char.chunk do |letter|
  %w{a e i o u}.include?(letter) ? "vowel" : "consonant"
end.each do |type, letters|
  puts "#{type}: #{letters.join}"
end

# consonant: th
# vowel: e
# consonant: q
# vowel: ui
# consonant: ck br
# vowel: o
# consonant: wn f
# vowel: o
# consonant: x

# Here's a string method that might make life easier...
"world".prepend("hello ")
# => "hello world"
