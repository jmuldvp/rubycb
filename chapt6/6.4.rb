# Certain elements of a hash have to go.

h = []
h[1] = 10
p h
h.delete(1)
p h

# Don't try and delete an element from a hash by mapping it to nil.

h = {}
h[5]
h[5] = 10
p h[5]
h[5] = nil
p h[5]
p h.keys
h.delete(5)
p h.keys

# The following code deletes all key-value pairs with certain value..
class Hash
  def delete_value(value)
    delete_if { |k,v| v == value }
  end
end

h = { 'apple' => 'green', 'potato' => 'red', 'sun' => 'yellow', 'katydid' => 'green' }
h.delete_value('green')
p h

# This code implements the opposite of Hash#merge; it extracts one hash from another..
class Hash
  def remove_hash(other_hash)
    delete_if { |k,v| other_hash[k] == v }
  end
end

squares = { 1 => 1, 2 => 4, 3 => 9 }
doubles = { 1 => 2, 2 => 4, 3 => 6 }
squares.remove_hash(doubles)
p squares

# To wipe out the contents of the entire Hash..
h = {}
1.upto(1000) { |x| h[x] = x }
p h.keys.size
p h.keys.size
p h.clear
p h
