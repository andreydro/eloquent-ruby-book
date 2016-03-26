class BaseDocument

  def title
    raise "Not implemented"
  end

  def title=
    raise "Not implemented"
  end

  def author
   raise "Not implemented"
  end

  def author=
    raise "Not implemented"
  end

  def content
    raise "Not implemented"
  end

end

class Document < BaseDocument
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

class LazyDcoument < BaseDocument

  attr_writer :title, :author, :content

  def initialize(path)
    @path = path
    @document_read = false
  end

  def read_document
    return if @document_read
    File.open(@path) do |f|
      @title = f.readline.chomp
      @author = f.readline.chomp
      @content = f.read
    end
    @document_read = true
  end

  def title
    read_document
    @title
  end

  def title=(new_title)
    read_document
    @title = new_title
  end

end

puts "Title: #{doc.title}"
puts "Author: #{doc.author}"
puts "Content: #{doc.content}"

class Title
  attr_reader :long_name, :short_name
  attr_reader :isbn

  def initialize(long_name, short_name, isbn)
    @long_name = long_name
    @short_name = short_name
    @isbn = isbn
  end
end

class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = last_name
    @last_name = last_name
  end
end

two_cities = Title.new("A Tale Of Two Cities",
                       "2 Cities", "0-999-99999-9")
dickens = Author.new("Charles", "Dickens")
doc = Document.new(two_cities, dickens, "It was the best...")

class Document
  # Most of the class omitted...

  def description
    "#{@title.long_name} by #{author.last_name}"
  end
end

def initialize(title, author, content)
  raise "title isn`t a String" unless title.kind_of? String
  raise "author isn`t a String" unless author.kind_of? String
  raise "cotent isn`t a String" unless content.kind_of? String
  @title = title
  @author = author
  @content = content
end

def is_longer_than?(number_of_characters)
  @content.length > number_of_characters
end

require "stringio"
open_string = StringIO.new("Sosay we all!\nSo say we all!\n")

five_even = [2, 3, 6, 8, 10]
five_even_set = Set.new(five_even)

