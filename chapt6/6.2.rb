# Hash with a default value.

# Problem is you don't want to get nil when you lookup a key value.
h = Hash.new
h[1]                            # => nil
h['do you have this string']    # => nil

h = Hash.new("nope")
p h[1]                            # => "nope"
p h['do you have this string']    # => "nope"

# If you want the default value for a missing key to depend on the key or the current
# state of the hash, pass a code block into the hash constructor. The block will be called
# each time someone requests a missing key..

h = Hash.new { |hash, key| (key.respond_to? :to_str) ? "nope" : nil }
p h[1]                            # => nil
p h['do you ahve this string']    # => "nope"

p "***************"

# This form can be used to calculate the frequency of certain words in a paragraph of text..
text = 'The rain in Spain falls mainly in the plain.'
word_count_hash = Hash.new 0
text.split(/W+/).each { |word| word_count_hash[word.downcase] += 1 }
p word_count_hash

p "***************"

first_letter_hash = Hash.new []
text.split(/W+/).each { |word| first_letter_hash[word[0,1].downcase] << word }
p first_letter_hash
p first_letter_hash["m"]
# => "The rain in Spain falls mainly in the plain."]

# The above code doesn't do what we want it to do because not all of those words have an 'm'
# Passing in a block to hash the constructor. The block is run every time the Hash can't
# find a key.

p "***************"

first_letter_hash = Hash.new { |hash, key| hash[key] = [] }
text.split(/\W+/).each { |word| first_letter_hash[word[0,1].downcase] << word }
p first_letter_hash

# When a letter can't be found in the hash, Ruby calls the block passed into the Hash
# constructor. That block puts a new array into the hash, using the missing letter as
# the key. Now the letter is bound to a unique array, and words can be added to that array
# normally.

# Note that if you want to add the array to the hash so it can be used later, you must assign
# it within the block of the Hash constructor. Otherwise, you'll get a new, empty array
# every time you access first_letter_hash["m"]. The words you want to append to the array
# will be lost.
