# Code blocks and iteration

# A regular one line code block can be written as...
[1,2,3].each { |i| puts i }

# Multiline block...
[1,2,3].each do |i|
  if i % 2 == 0
    puts "#{i} is even."
  else
    puts "#{i} is odd."
  end
end
# 1 is odd.
# 2 is even.
# 3 is odd.

# Bracket syntax has a higher precedence than the do...end syntax.
1.upto 3 do |x|
  puts x
end

# This syntax gives an error..
# 1.upto 3 { |x| puts x }   # => SyntaxError: compile error.

# This is how it should be used instead..
1.upto(3) { |x| puts x }

# Can instantiate a block as a Proc.
hello = lambda { "Hello" }
hello.call    # => "Hello"

log = lambda { |str| puts "[LOG] #{str}" }
log.call("A test log message.")   # => [LOG] A test log message.

# Here's a shorter syntax for creating Proc objects..
log = ->(str) { puts "[LOG] #{str}" }
log.call("A test log message.")   # => [LOG] A test log message.

# A block can accept arguments..
{1=>2, 2=>4}.each { |k, v| puts "Key #{k}, value #{v}" }
# Key 1, value 2
# Key 2, value 4

# Since Proc objects are created like other objects, you can create factory methods
# whose return values are customized pieces of executable Ruby code. Here's a simple
# factory method for code blocks that do multiplication.
def times_n(n)
  ->(x) { x * n }
end

# This uses the factory to create and use two cusotmized methods..
times_ten = times_n(10)
puts times_ten.call(5)       # => 50
puts times_ten.call(1.25)    # => 12.5

circumference = times_n(2*Math::PI)
puts circumference.call(10)
puts circumference.call(3)
# 62.83185307179586
# 18.84955592153876

ceiling = 50
# Which of these numbers are less than the target?
[1,10,49,50.1,200].select { |x| x < ceiling }  # => [1, 10, 49]
