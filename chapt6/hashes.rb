p empty = Hash.new                      # => {}
p empty = {}                            # => {}

p number = { :two => 2, :eight => 8 }   # => {:two=>2, :eight=>8}
p numbers = Hash[:two, 2, :eight, 8]    # => {:two=>2, :eight=>8}

p numbers = { two: 2, eight: 8 }        # => {:two=>2, :eight=>8}

p numbers[:two]         # => 2
p numbers[:ten] = 10    # => 10
p numbers               # => {:two=>2, :eight=>8, :ten=>10}

p "*********************"
p numbers.keys          # => [:two, :eight, :ten]
p numbers.values        # => [2, 8, 10]
p numbers.to_a          # => [[:two, 2], [:eight, 8], [:ten, 10]]
p "*********************"
p motto = "Don't tread on me"
flag = { :motto => motto,
          :picture => "rattlesnake.png"}
p motto.upcase!
p flag[:motto]        # => "DON'T TREAD ON ME"

p "*********************"
# Consider some simple data for a person in an address book. For a side-by-side comparison
# I'll represent identical data as an array, then as a hash:
a = ["Maury", "Momento", "123 Elm St.", "West Covina", "CA"]
h = { :first_name => "Maury",
      :last_name => "Momento",
      :address => "123 Elm St.",
      :city => "West Covina",
      :state => "CA" }
p h

p "*********************"

h = { one_squared: 1, two_squared: 4, three_squared: 9, four_squared: 16 }
p h
puts h

p "*********************"

class StringHolder
  attr_reader :string
  def initialize(s)
    @string = s
  end

  def ==(other)
    @string == other.string
  end

  def hash
    @sting.hash
  end
end
a = StringHolder.new("The same string.")
b = StringHolder.new("The same string.")
a == b
p a.hash    # => -1082028829561863181
p b.hash    # => -1082028829561863181
