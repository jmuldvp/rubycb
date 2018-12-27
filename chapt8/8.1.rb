# Creating and invoking a block

# Putting Ruby code into an object so that it can be used later
a_block = { |x| puts x }  # Wrong way to do this

# Correct way to do this..
a_block = lambda { |x| puts x }
a_block = ->(x) { puts x }

a_block.call "Hello World!"
# Hello World!

# You can accept a block as an argument to a method by prepending & to the arguement name.
# This way, you can write your own trivial version of the lambda method.
def my_lambda(&a_block)
  a_block
end

b = my_lambda { puts "Hello World My Way!" }
b.call      # => "Hello World My Way!"

# A newly defined block is actually a Proc object..
b.class     # => Proc

# Kernel#lambda, Kernel#proc, Proc.new all do basically the same thing. These are nearly equivalent..
a_block = Proc.new { |x| puts x }
a_block = proc { |x| puts x }
a_block = lambda { |x| puts x }
a_block = ->(x) { puts x }

# Kernel#lambda or Kernel#-> is the preferred way to call blocks because it gives you
# block objects that act more like Ruby methods.
add_lambda = ->(x,y) { x + y }
add_lambda.call(4)
# ArgumentError: wrong number of arguments (1 for 2)

add_lambda.call(4,5,6)
# ArgumentError: wrong number of arguments (3 for 2)

# A block created with a lambda acts like a Ruby method. If you don't specify the right
# number of arguments, you can't call the block. But a block created with Proc.new acts
# like the anonymous code block you pass into a method like Enumerable#each

add_procnew = Proc.new { |x,y| x + y }

add_procnew.call(4)
# TypeError: nil can't be coerced into Fixnum

add_procnew.call(4,5,6)
