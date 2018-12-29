# Adding elements to a Hash
# Problem: have loose or existing items that I want to put into an existing hash.

# To add a single key-value pair, assign the value to the element lookup expression
# for the key; that is, call hash[key]=value. The assignment will override any previous
# value for that key.

h = {}
h["Greensleeves"] = "all my join"
p h                         # => {"Greensleeves"=>"all my join"}
h["Greensleeves"] = "my delight"
p h                         # => {"Greensleeves"=>"my delight"}

p "***************"

key = "Modify me if you can"
h = { key => 1 }
p key.upcase!               # => "MODIFY ME IF YOU CAN"
p h[key]                    # => nil
h["Modify me if you can"]   # => 1

p h.keys
# h.keys[0].upcase!           # => RuntimeError: can't modify frozen String

p "***************"

# To add an array of key-value pairs to a hash, either iterate over the array with
# Array#each, or pass the hash into Array#inject. Using inject is slower, but the code
# is more concise.
squares = [[1,1], [2, 4], [3, 9]]
results = {}
squares.each { |k,v| results[k] = v }
p results                 # => {1=>1, 2=>4, 3=>9}

p squares.inject({}) { |h, kv| h[kv[0]] = kv[1]; h }
# {1=>1, 2=>4, 3=>9}

p "***************"

# To turn a flat array into the key-value pairs of a hash, itterate over the array
# elements two at a time..
class Array
  def into_hash(h)
    unless size % 2 == 0
      raise StandardError, "Expected array with even number of elements"
    end
    0.step(size-1, 2) { |x| h[self[x]] = self[x + 1] }
    h
  end
end

squares = [1,1,2,3,4,9]
results = {}
p squares.into_hash(results)  # => {1=>1, 2=>3, 4=>9}

# The following results in an error
# [1,1,2].into_hash(results)
# Expected array with even number of elements (StandardError)

# In order to insert into a hash every key-value pair from another hash, use Hash#merge!
# if key is present in both hashes when a.merge!(b) is called, the value in b takes precedence
# over the value in a..

p "***************"

squares = { 1 => 1, 2 => 4, 3 => 9 }
cubes = { 3 => 27, 4 => 256, 5 => 3125 }
squares.merge!(cubes)
p squares         # => {1=>1, 2=>4, 3=>27, 4=>256, 5=>3125}
p cubes           # => {3=>27, 4=>256, 5=>3125}

p "***************"

# Hash#merge! also has a nondestructive version, Hash#merge, which creates a new Hash
# with elements from both parent hashes. Again, the hash passed in as an argument takes
# precedence. To completely replace the entire contents of one hash with the contents of
# another use Hash#replace
squares = { 1 => 1, 2 => 4, 3 => 9 }
cubes = { 1 => 1, 2 => 8, 3 => 27 }
squares.replace(cubes)
p squares          # => {1=>1, 2=>8, 3=>27}

# This is different from simply assigning the cubes hash to the squares variable name,
# because cubes and squares are still separate hashes; they just happen to contain the
# same elements right now. Changing cubes won't affect squares..
cubes[4] = 64
p squares         # => {1=>1, 2=>8, 3=>27}
