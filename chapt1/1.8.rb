# Allow modifications to class methods while retaining setup and teardown logic.

module MyHelper
  def save
    puts "before"
    super
    puts "after"
  end
end

class MyBadClass
  include MyHelper

  def save
    puts "my code"
  end
end

MyBadClass.new.save
# => my code

# The expectation would be that the 'before' and 'after' text would show up.
# See next example.
module MyHelper
  def save
    puts "before"
    super
    puts "after"
  end
end

class MyGoodClass
  prepend MyHelper

  def save
    puts "my code"
  end
end

MyGoodClass.new.save
# => before
# => my code
# => after

# Inspection of prepend shows the class hierarchy.  Let's compare the 2 above..

def parents(obj)
  ((obj.superclass ? parents(obj.superclass) : []) << obj).reverse
end

parents(MyGoodClass)
# => [Class, Object, BasicObject, Module]

parents(MyBadClass)
# => [MyBadClass, BasicObject, Object]
