# Substituting variables into an existing strings

# Problem: Create a string that contains Ruby expressions or variable substitutions without performing the substitutions.

template = 'Oceania has always been at war with %s.'
template % 'Eurasia'    # "Oceania has always been at war with Eurasia."
template % 'Eastasia'   # "Oceania has always been at war with Eastasia."

'To 2 decimal places: %.2f' % Math::PI    # => "To 2 decimal places: 3.14"
'Zero-padded: %.5d' % Math::PI            # => "Zero-padded: 00003"

require 'erb'
template = ERB.new %q{Chunky <%= food %>!}
food = "bacon"
template.result(binding)      # => "Chunky bacon!"
food = "peanut butter"
template.result(binding)      # => "Chunky peanut butter!"

# Can omit the call to binding if not in an irb sesssion.
puts template.result


# Here's a little more of a sophisticated ERB template
template = %q{
<% if problems.empty? %>
  Looks like your code is clean!
<% else %>
  I found the follwing possible problems with your code:
  <% problems.each do |problem, line| %>
    * <%= problem %> on line <%= line %>
  <% end %>
<% end %>}.gsub(/^\s+/, '')
template = ERB.new(template, nil, '<>')

problems = [["use of is_a? instead of duck typing", 23], ["eval() is usually dangerous", 44]]
template.run(binding)
# I found the follwing possible problems with your code:
# * use of is_a? instead of duck typing on line 23
# * eval() is usually dangerous on line 44

problems = []
template.run(binding)
# Looks like your code is clean!

# If you use single quotes instead of double quotes to define a string with substitutions,
# the substitutions won't be activiated. They could be used in this string as a template..
class String
  def substitute(binding=TOPLEVEL_BINDING)
    eval(%{"#{SELF}"}, binding)
  end
end

template = %q{Chunky #{food}!}    # => "Chunky \#{food}!"

food = 'bacon'
template.substitute(binding)      # => "Chunky bacon!"
food = 'peanut butter'
template.substitute(binding)      # => "Chunky peanut butter!"

# Must be careful using `eval`. If not used the right way, it could give an attacker the
# ability to run arbitrary code.

food = '#{system("dir")}'
puts template.substitute(binding)
# Chunky #{system("dir")}!
