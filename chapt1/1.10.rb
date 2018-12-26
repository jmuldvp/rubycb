# New classes

# The fiber class is an alternative to threads.
thread = Thread.new do
  puts "Hello world!"
end
# Hello world!

fiber = Fiber.new do
  puts "Hello world!"
end

fiber.resume
# Hello world!

# The fiber class is more in control of the programmer than threads. Here's more on fiber..

fiber = Fiber.new do |multiply|
  Fiber.yield multiply * 10
  Fiber.yield multiply * 10_000_000
  "done"
end

fiber.resume(2)
# => 20

fiber.resume(2)
# => 20000000

fiber.resume(2)
# => FiberError: dead fiber called

# Encoding class examples

require 'pp'
pp Encoding.list

#<Encoding:ASCII-8BIT>,
#<Encoding:UTF-8>,
#<Encoding:US-ASCII>,
#<Encoding:UTF-16BE (autoload)>,
#<Encoding:UTF-16LE (autoload)>,
# .
# .

string = "some string \u2764" # this will output a heart

string.encoding
# => #<Encoding:UTF-8>

string = string.encode(Encoding::ISO_8859_1)
# Encoding::UndefinedConversionError: U+2764 from UTF-8 to ISO-8859-1

string = string.force_encoding(Encoding:ISO_8859_1)
# "some string \xE2\x90\xA4"

string.encoding
# <Encoding:ISO-8859-1>


# Random.r provides better functionality than Kernel#r

Random.rand
# => 0.936632494939354

seed = 1234

random_generator = Random.new(seed)
random_generator.rand
# => 0.1915194503788923
random_generator.rand
# => 0.6221087710398319

random_generator2 = Random.new(seed)
random_generator2.rand
# => 0.1915194503788923
random_generator2.rand
# => 0.6221087710398319

random_generator2.seed
# => 1234
