# Need to iterate over a data structure and build a string at the same time.

hash = { key1: "val1", key2: "val2" }
string = ""
hash.each { |k, v| string << "#{k} is #{v}\n"}
puts string
# key1 is val1
# key2 is val2

# Here is a variant from the above but harder to read..
string = ""
hash.each { |k, v| string << k.to_s << " is " << v << "\n"}

# If the data structure is an array, or easily transformed into an array, it's
# usually more efficient to use Array#join.

puts hash.keys.join("\n") + "\n"
# key1
# key2

# Array#join does not work precisely the same way as repeated appends to a string. Array#join accepts a seperator string that it inserts between every two elements of the array. Unlike a simple string-building iteration over an array, it will not insert the seperator string after the last element in the array. Example...

data = ['1', '2', '3']
s = ''
data.each { |x| s << x << ' and a ' }
s                       # => "1 and a 2 and a 3 and a "
data.join(' and a ')    # => "1 and a 2 and a 3"

# To simulate the behavior of Array#join across an iteration, you can use Enumerable#each_with_index and omit the seperator on the last index.
# This works only if you know how long the Enumerable is going to be:

s = ''
data.each_with_index { |x, i| s << x; s << "|" if i < data.length-1 }
s               # => "1|2|3"
