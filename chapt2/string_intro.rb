# Can get length a few ways...
string = "My first string"

string.length # => 15
string.length() # => 15

string.count 'i'  #  => 2  # Where i occurs twice
string.count('i')

string.length.next # => 16

puts "This string\ncontains a newline"
# This string
# contains a newline

puts 'it may look like this string contains a newline\nbut it doesn\'t'
# it may look like this string contains a newline\nbut it doesn't

puts 'Here is a backslash: \\'
# Here is a backslash: \

long_string = <<EOF
Here is a long string
With many paragraphs
EOF

# "Here is a long string\nWith many paragraphs\n"

puts long_string

# Here is a long string
# With many paragraphs


string      # => "My first string"
string.slice(3, 5)    # => "first"

string.byteslice(3) + string.byteslice(4) + string.byeslice(5) + string.byteslice(6) + string.byteslice(7)
# => "first"

string[3, 5] # => "first"

string.upcase   # => "MY FIRST STRING"
string          # => "My first string"
string.upcase!  # => "MY FIRST STRING"
string          # => "MY FIRST STRING"

string.empty?   # => false
string.include? 'MY'  # => true
