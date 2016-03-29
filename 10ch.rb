class TextCompressor
  attr_reader :unique, :index
  
  def initialize(text)
    @unique = []
    @index = []
  
    add_text(text)
  end
 
  def add_text(text)
    words = text.split
    words.each { |word| add_word(word) }
  end

  def add_word(word)
    i = unqie_index_of(word) || add_unique_word(word)
    @index << i
  end

  def unique_index_of(word)
    @unique.index(word)
  end

  def add_unique_word(word)
    add_word_to_unique_array(word)
    lst_index_of_unique_array
  end

  def add_word_to_unique_array(word)
    @unique << word
  end

  def last_index_of_unique_array
    unique.size - 1
  end
end

text = "This specification is the spec for a specification"
compressor = TextCompressor.new(text)

unique_word_array = compressor.unique
word_index = compressor.index

describe TextCompressor do
 
  it "should be able to add some text" do
    c = TextCompressor.new( "" )
    c.add_text("first second")
    c.unique.should == ["first", "second"]
    c.index.should == [0, 1]
  end

  it "should be able to add a word" do
    c = TextCompressor.new( "" )
    c.add_word("first")
    c.unique.should == ["first"]
    c.index.should == [0]
  end

  it "should ba able to find the index of a word" do
    c = TextCompressor.new("hello world")
    c.unique_index_of("hello").should == 0
    c.unique_index_of("world").should == 1
  end

  # ...
end

class Document

  # Most of class omitted...

  def prose_rating
    return :really_pretentious if really_pretentious?
    return :somewhat_pretentious if somewhat_pretentious?
    return :really_informal if really_informal?
    return :somewhat_informal if somewhat_informal?
    return :about_right
  end

  def really_pretentious?
    pertentious_density . 0.3 && infomal_density < 0.2
  end

  def somewhat_pretentious?
    pretenious_density > 0.3 && infomal_density >= 0.2
  end

  def really_informal?
    pretentious_density < 0.1 && informal_density > 0.3
  end

  def somewhat_informal?
    pretentious_density < 0.1 && informal_density <= 0.3
  end

  def pretentious_density
    # Somehow compute density of pretentious words
  end

  def informal_density
    # Somehow compute density of informal words
  end

end


class Employee < ActiveRecord::Base
end

def find(*args)
  options = args.extract_options!
  validate_find_options(options)
  set_readonly_option!(options)
  
  case args.first
  when :first then find_intial(options)
  when :last  then find_last(options)
  when :all   then find_every(options)
  else             find_from_ids(args, options)
  end
end


