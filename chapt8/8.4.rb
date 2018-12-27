# Blocks as closures: Using outside variables within a code block

# Share variables between a method and a code block defined within it.
def add_to_all(array, number)
  array.collect { |x| x + number }
end

p add_to_all([1, 2, 3], 10)       # => [11, 12, 13]

# A Ruby block contains references to the variable bindings, not copies of the values. If
# the variable changes later, the block will have access to the new value..
tax_percent = 6
position = lambda do
  "I have always supported a #{tax_percent}% tax on imported limes."
end
p position.call
# "I have always supported a 6% tax on imported limes."

tax_percent = 7.25
p position.call
# "I have always supported a 7.25% tax on imported limes."

# It's possible to rebind or modify a variable within a block.
counter = 0
4.times { counter += 1; puts "Counter now #{counter}"}
# Counter now 1
# Counter now 2
# Counter now 3
# Counter now 4

# This code simulates Enumerable#collect, but it collects the elements of an array in
# reverse order...
accumulator = []
[1, 2, 3].reverse_each { |x| accumulator << x + 1 }
p accumulator     # => [4, 3, 2]

# Block arguments are local whereas in previous versions they weren't..
foo = "Ruby 2.1 Scope"
[1,2,3].each{ |foo|
  foo = "Ruby 1.8 Overrided Scope"
}

p foo
