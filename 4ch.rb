a_string_with_a_quote = "Say it ain\`t so!"

a_string_with_a_backslash = "This is a backslash: \\"

double_quoted = "I have a tab: \t and a newline" \n"

author = "Ben Bova"
title = "Mars"
puts "#{title} is written by #{author}"

str = '"Stop", she said, "I cannot deal with the backslashes"'

str = %q{"Stop",she said, "I can`t live without 's and "s."}

str %q<"Stop", she said, "I can`t live without 's and "s.">

a_multiline_string = "a multi-line
string"

another_one = %q{another multi-line
string}

heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF

"It was a darck and stormy night\n".chomp

"It is warm outside".sub( "warm", "cold" )

puts "yes yes".sub("yes", "no")
puts "yes yes".gsub("yes", "no")

"It was a darck and stormy night".split

"Bill:Shakespeare:Playwright:Globe".split( ':' )

title = "It was a dark and stormy night"
title.sub!( "dark", "bright" )
title.sub!( "stormy", "clear" )

"It was a dark and stormy night".index( "dark" )

@author.each_char { |c| puts c }

@author.each_byte { |b| puts b }

@content.each_line { |line| puts line }

inflect.irregular("person", "people")

inflections.plurals.each do |(rule), replacement|
  break if result.gsub!(rule, replacement)
end

first_name = "Karen"
given_name = first_name

first_name[D] = "D"

first_name = first_name.upcase

first_name[-1]

