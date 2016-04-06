class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end
end

class Document
  def words
    @content.split
  end

  def word_count
    words.size
  end
end

class Document
  def average_word_length
    len = words.inject(0.0){ |total, word| word.size + total }
    len / words.size
  end
end

empty_doc = Document.new("Empty!", "Russ", "")
puts empty_doc.average_word_length

require "document"

class Document
  def average_word_length
    return 0.0 if word_count == 0
    total = words.inject(0.0){ |result, word| word.size + result}
    total / word_count
  end
end

class String
  def +(other)
    if other.kind_of? Document
      new_content = self + other.content
      return Document.new(other.title, other.author, new_content)
    end
    result = self.dup
    result << other.to_str
    result
  end
end

class Document
  # Stuff omitted...

  def word_count
    words.size
  end

  alias_method :number_of_words, :word_count
  alias_method :size_in_words,       :word_count

  # Stuff omitted...
end

class String
  alias_method :old_addition, :+

  def +(other)
    if other.kind_of? Document
      new_content = self + other.content
      return Document.new(other.title, other.author, new_content)
    end
    old_addition(other)
  end
end

class Document
  private :word_count
end

class Document
  public :word_count
end

class Document
  remove_method :word_count
end

class Pathname

  # Bits deleted...

  def initialize(path)
    # Set up Pathname instance...
  end

  # ==, <=>, tec. methods deleted...
end

class Pathname
  def each_line(*args, &block) # :yield line
    # iterate throuch each line in the file...
  end

  def read(*args)
    # Read the contents of the file...
  end

  # ...
end

class String
  def blank?
    self !~ /\S/
  end
end

s = " Ruby Rocks "
s.squish!

module ActiveSupport
  module CoreExtensions
    module String
      module Filters

        # Some code deleted...

        def squish!
          strip!
          gsub!(/\s+/, '  ')
          self
        end

      end
    end
  end
end

class String
  # Lot of stuff deleted...
  include ActiveSupport::CoreExtensions::String::Filters
end

require "active-support"

title = "Hitch Hikers Guild To the Galaxy by Douglas Adams"
array = title.split(//)

array.first
array.second
array.third
array.fourth
array.fifth

