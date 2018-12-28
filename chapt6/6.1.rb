# Symbols as hash keys
people = Hash.new
people[:nickname] = 'Matz'
people[:language] = 'Japanese'
people['last name'.intern] = 'Matsumoto'
p people[:nickname]               # => "Matz"
p people[:'nickname'.intern]      # => "Matz"

p "***************"

# Object id's are not the same
p 'name'.object_id    # => 70192688961600
p 'name'.object_id    # => 70192688961500
p 'name'.object_id    # => 70192688961400

# Object id's are the same with symbols
p :name.object_id           # => 86108
p :name.object_id           # => 86108
p 'name'.intern.object_id   # => 86108
p 'name'.intern.object_id   # => 86108

# Using symbols instead of strings saves memory and time. It saves memory because
# there's only one symbol instance, instead of many string instances. If you have
# many hashes that contain the same keys, the memory savings add up.

# Using symbols as hash keys is faster because the hash value of a symbol is simply
# its object ID. If you use strings in a hash Ruby must calculate the hash value of a
# string each time it's used as a hash key.
