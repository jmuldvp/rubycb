# Binding a block argument to a variable
def repeat(n)
  n.times { yield } if block_given?
end
repeat(2) { puts "Hello." }
# Hello
# Hello
def repeat(n, &block)
  n.times { block.call } if block
end
repeat(2) { puts "Hello." }
# Hello.
# Hello.

def repeat(n, &block)
  n.times { yield } if block
end
repeat(2) { puts "Hello." }
# Hello.
# Hello.


# Many methods for collecitons, like each, select, and detect, accept code blocks. It's
# easy to wrap such methods when your own methods can bind a block to a variable. Here,
# a method called biggest finds the largest element of a colleciton that gives a true
# result for the given block.
def biggest(collection, &block)
  block ? collection.select(&block).max : collection.max
end

array = [1, 2, 3, 4, 5]
biggest(array) {|i| i < 3}    # => 2
biggest(array) {|i| i != 5}   # => 4
biggest(array)                # => 5

# This code calls a code block limit times, each time passing ina  random number between
# min and max...
def pick_random_numbers(min, max, limit)
  limit.times { yield min+rand(max+1) }
end

# This code is a wrapper method for pick_random_numbers. It calls a code block 6 times,
# each time with a random number from 1 to 49:
def lottery_style_numbers(&block)
  pick_random_numbers(1, 49, 6, &block)
end

lottery_style_numbers { |n| puts "Lucky number: #{n}" }
# Lucky number: 22
# Lucky number: 7
# Lucky number: 48
# Lucky number: 3
# Lucky number: 19
# Lucky number: 38

# The code block argument must always be the very last argument defined for a method.
# This means that if your method takes a variable number of arguments, the code block
# argument goes after the container for the variable arguments..
def invoke_on_each(*args, &block)
  args.each { |arg| yield arg }
end

invoke_on_each(1, 2, 3, 4) { |x| puts x ** 2 }
# 1
# 4
# 9
# 16

# Here is how it looks "blockified"...
invoke_on_each = ->(*args, &block) do
  args.each { |arg| block.call(arg) }
end

invoke_on_each.call(1, 2, 3, 4) { |x| puts x ** 2 }
# 1
# 4
# 9
# 16
