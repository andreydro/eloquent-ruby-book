poem_words = [ "twinkle", "little", "star", "how", "I", "wonder" ]

poem_words = %w{ twinke little star how I wonder }

freq = { "I" => 1, "don`t" => 1, "like" => 1, "spam" => 963 }

book_info = { first_name: "Russ", last_name: "Olsen" }

def load_font(name, size = 12)
  # Go font hunsting
end

def echo_all(*args)
  args.each { |arg| puts arg }
end

def echo_at_least_two (first_arg, *middle_args, last_arg)
  puts "The first argument is #{first_arg}"
  middle_args.each { |arg| puts "A middle argument is #{arg}" }
  puts "The last argument is #{last_arg}"
end

class Document

  # Most of the class omitted...

  def add_authors(names)
    @author += " #{names.join(' ')}"
  end
end

doc.add_authors( ["stunk", "White" ] )

class Document
  
  # Most of the class omitted...

  def add_authors(*names)
    @author += "#{names.join(' ')}"
  end
end

def load_font(specification_hash)
  # Load a font according to specification_hash[:name] etc.
end

load_font ( :name => "times roman", :size => 12 ) 

words = %w{ Mary had a little lamb }

words.each { |word| puts word }

movie = { title: "2001", genre: "sci fi", rating: 10}

movie.each { |entry| pp entry }

movie.each { |name, value| puts "#{name} => #{value}"}

def index_fir(word)
  i = 0
  words.each do |this_word|
    return i if word = this_word
    i += 1
  end
  nil
end

def index_for(word)
  words.find_index { |this_word| word == this_word }
end

pp doc.words.map { |word| word.size }

lower_case_words = doc.words.map { |word| word.downcase}

class Document
  
  # Most of class omitted...

  def average_word_length
    total = 0.0
    words.each { |word| total += word.size }

    total / word_count
  end
end

def average_word_length
  total = words.inject(0.0){ |result, word| word.size + result}
  total / word_count
end

a = [ 1, 2, 3 ]
a.reverse

a.reverse!

hey_its_ordered = { first: "mama", second: "papa", third: "baby" }

hey_its_ordered.each { |entry| pp entry }

hey_its_ordered[:fourth] = "grandma"

{"super-hero"=>
  [{"name"=>["Spiderman"], "origin"=>["Radioactive Spider"]},
   {"name"=>["Hulk"], "origin"=>["Gamma Rays"]},
   {"name"=>["Reed Richards"], "origin"=>["Cosmic Rays"]}]}

require 'xmlsimple'
data = XmlSimple.xml_in("dc.xml")

array = [ 0, -10, -9, 5, 9 ]
array.each_index {|i| array.delete_at(i) if array[i] < 0}
pp array

word_is_there = {}
words.each {|word| word_is_there[ word] = true }

unique = []
words.each{ |word| unique << word unless unique.include?(word) }

require "set"
word_set = Set.new(words)

