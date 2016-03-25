[0-9a-zA-Z]

\d
\w
\s
The (car|boat) is red

\d\d: \d\d (AM|PM)

AB*

[aeiou]*

[0-9]*

[0-9a-f]*

.*

puts /\d\d:\d\d (AM|PM)/ =~ "10:24 PM"

/May/ =~ "Sometime in June"

the_time = "10:24 AM"
puts "It's morning!" if /AM/ =~ the_time

puts "It's morning" if "10:24 AM" =~ /AM/

puts "It's matches!" if /AM/i =~ "am"

class Document
  #Most of the class omitted...

  def obscure_times!
    @content.gsub!( /\d\d:\d\d (AM|PM)/, "**:** **" )
  end
end

/\AOnce upon a time/

/and they all lived happily ever after\z/

content = "The Princess And The Monkey

Once upon a time there was a princess...
...and they all lived happily ever after.

The End"

puts "Found it" if ccontent =~ /^Ince upon a time/

puts "Found it" if content =~ /happily ever after\.$/

/^Once upon a time.*happily ever after\.$/

/^Once upon a time.*happily ever after\.$/m

def zone_offset(zone, year=self.now.year)
  # ...
  zone = zone.upcase
  # ...
end

if /\A[+-])(\d\d):?(\d\d)\z/ =~ zone

elsif ZoneOffset.insluce?(zone)

puts /abc*/ == "abccccc"

puts /abc*/ =~ "abccccc"
