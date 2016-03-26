book = Book.find('all')

a == c
a === c
a.eql?(c)
a.equal?(c)

x = "all"
y = "all"

author = "jules verne"
title = "from earth to the moon"
hash = { author => title }

author.upcase!

the_string = :all.to_s

the_symbol = "all".to_sym

x = Object.new
pp x.public_methods

["pretty_print_cycle",
"pretty_print_inspect",
"clone",
...
]

person = {}
person[:name] = "russ"
person[:eyes] = "misty blue"

puts "Name: #{person[:name]} Eyes: #{person[:eyes]}"

