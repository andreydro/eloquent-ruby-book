do_something do
  puts "Hello from inside the block"
end

def do_something
  yield if block_given?
end

def do_something_with_an_arg
  yield("Hello World") if block_given?
end

do_something_with_an_arg do |message|
  puts "The message is #{message}"
end

def print_the_value_returned_by_the_block
  if block_given?
    value = yield
    puts "The block returned #{value}"
  end
end

print_the_value_returned_by_the_block {3.14159 / 4.0}

class Document

  # Stuff omitted...

  def each_word
    word_array = words
    index = 0
    while index < words.size
      yield(word_array[index])
      index += 1
    end
  end
end

d = Document.new("Truth", "Gump", "Life is like a box of ...")
d.each_word {|word| puts word}

def each_word
  words.each { |word| yield(word) }
end

class Document
  def each_character
    index = 0
    while index < @content.size
      yield( @content[index] )
      index += 1
    end
  end
end

class Document

  # Stuff omitted

  def each
    # iterate over the words as in our frist example
  end

  def each_character
    # iterate over the characters
  end
end

12.times { |x| puts "The number is #{x}"}

class Document
  # Most of the class omitted...

  def each_word_pair
    word_array = words
    index = 0
    while index < (word_array.size - 1)
      yield word_array[index], word_array[index + 1]
      index += 1
    end
  end
end

doc = Document.new("Donuts", "?", "I love donuts mmm donuts")
doc.each_word_pair{ |rist, second| puts "#{first} #{second}"}

class Document
  include Enumerable

  # Most of the class omitted...

  def each
    words.each { |word| yield(word) }
  end
end

doc = Document.new("Advice", "Harry", "Go ahead make my day")

def each_word_pair
  words.each_cons(2) { |array| yield array[0], array[1] }
end

doc = Document.new("example", "russ", "we are all characters")
enum = Enumerator.new(doc, :each_character)

doc.each_word do |word|
  raise "boom" if word == "now"
end

def each_name
  name_server = open_name_server
  begin
  while name_server.has_more?
    yield name_server.read_name
  end
  ensure
    name_server.close
  end
end

def count_till_tuesday(doc)
  count = 0
  doc.each_word do |word|
    count += 1
    break if word == "Tuesday"
end
count

puts "Contents of/etc directory:"
etc_dir = Dir.new("/etc")
etc_dir.each {|entry| puts entry}

require "resolv"
Resolv.each_address("www.google.com") {|x| puts x}

ObjectSpace.each_object(String) {|the_string| puts the_string}
