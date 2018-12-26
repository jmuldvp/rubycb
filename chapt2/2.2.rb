# substituting variables into strings

number = 5
"the number is #{number}."      # => "The number is 5."
"The number is #{5}."           # => "The number is 5."
"The number after #{number} is #{number.next}."
# => "The number after 5 is 6."

"The number prior to #{number} is #{number-1}."
# => "The number prior to 5 is 4."

"We're ##{number}!"     # => "We're #5!"

# There's really not any time this would need to be done but it shows the capability...

%{Here is #{class InstantClass
  def bar
    "some text"
  end
end
InstantClass.new.bar
}.}
# => "Here is some text."

# Here is another capability, although bad, but should be aware of it..
"I've set x to #{x = 5; x += 1}."     # => "I've set x to 6."
x                                     # => 6

# To avoid string interpolation, use the escape character.
"\#{foo}"       # => "\#{foo}"
'#{foo}'        # => '\#{foo}'
