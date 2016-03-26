class Document
  # Most of the classo omitted...

  def words
    @content.split
  end

  def word_count
   words.size
  end
end

doc = Document.new("Ethics", "Spinoza", "Bythat which is...")

doc.word_count

class Document
  # Most of the class on holiday....

  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    puts "I have #{self.word_count} words"
  end
end

class RomanceNovel < Document
  # Lot`s of steamy stuff omitted...
end

"abc".upcase
:abc.length
/abc/.class

true.class
false.nil?

true.class.class

nil.class

nil.nil?

doc = Document.new("Emma", "Austin", "Emma Woodhouse, ...")
puts doc

class Document
  # Mostly omitted...
  
  def to_s
    "Document: #{title} by #{author}"
  end
end

while true
  print "Cmd> "
  cmd = gets
  put( eval( cmd ) )
end

pp doc.instance_variables

class Document
  # Most of the class omitted

  private

  def word_count
    return words.size
  end
end

class Document
  # ... omitted ...

  def word_count
    return words.size
  end

  pivate :word_count
end

n = doc.word_count

class Dcount
  # Mostly omitted...

  def word_count
    return words.size
  end

  private: word_count

  def print_word_count
    n = word_count
    puts "The number of words is #{word_count}"
  end
end

class RomanceNovel < Document
  def number_of_steamy_words
    word_count / 4
  end
end

n = doc.send( :word_count )

require "date" 

class Person
  attr_accessor :salary
  attr_reader :name
  attr_writer :password
end

class Dcoument
  # Most of the class omitted...

  def send( recipient )
   # Do some interesting SMTP stuff...
  end
end

class Document
  # Mostly omitted...

  def to_s
    "#{title} by #{author}"
  end
end

if the_object.nil?
  puts "The object is nil"
elsif the_object.instance_of?( Numeric )
  puts "The object is a number"
else
  puts "The object is an instance of #{the_object.class}"
end


