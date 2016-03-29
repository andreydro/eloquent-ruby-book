require "test/unit"
require "document.rb"

class DocumentTest < Test::Unit::TestCase 

  def setup
    @text = "A bunch of words"
    @doc = Document.new("test", "nobody", @text) 
  end

  def test_document_holds_onto_contents
    assert_equal @text, @doc.content, "Contents are still there"
  end
 
  def test_that_doc_can_return_words_in_array
    assert @doc.words.include?( "A" )
    assert @doc.words.include?( "bunch" )
    assert @doc.words.include?( "of" )
    assert @doc.words.include?( "words" )
  end

  def test_tha_word_count_is_correct
    assert_equal 4, @doc.word_count, "Word count is correct"
  end
end

assert_match /times.*/, "times new roman"

assert_instance_of String, "hello"

assert_raise ZeroDivisionError do
  x = 1/0
end

assert_nothing_thrown do
  x = 1/2
end

require "document"

describe Document do
  before :each do
    @text = "A bunch of words"
    @doc = Document.new("test", "nodoby" @text)
  end

  it "should hhold on to the contants" do
    @doc.content.should == @text
  end

  it "should return all of the words in th document" do
    @doc.words.should include( "A" )
    @doc.words.should include( "bunch" )
    @doc.words.should include( "of" )
    @doc.words.should include( "words" )
  end

  it "should know how many words it contains" do
    @doc.word_count.should == 4
  end

end

class PrintableDocument < Document
  def print(printer)
    return "Printer unavailable" unless printer.available?
    printer.render("#{title}/n")
    printer.render("By #{author}/n")
    printer.render(content)
    "Done"
  end
end


describe PrintableDocument do
  before :each do 
    @text = "A bunch of words"
    @doc = PrintableDocument.new("test", "nobody", @text)
  end

  it "should know how to print itself" do
    stub_printer = stub :available? => true, :render = > nil
    @doc.print(stub_printer).should == "Done"
  end

  it "should return the proper string if printer is offline" do
    stub_printer = stub :available => false, :render => nil
    @doc.print(stub_printer).should == "Printer unavailable"
  end
end

it "should know how to print itself" do
  mock_printer = mock("Printer")
  mock_printer.should_receive(:available?).and_return(true)
  mock_printer.should_recieve(:render).exactly(3).times
  @doc.print(mock_printer).should == "Done"
end

require "test/unit"
require "shoulda"
require "document.rb"

class DocumentTest < Test::Unit::TestCase
  context "A basic document class" do
    def setup
      @text = "A bunch of words"
      @doc = Document.new("a test", "russ", @text)
    end

    should "hold on to the contents" do
      assert_equal @text , @doc.content, "Contents still there" 
    end

    # Rest of the test omitted...
  end
end


describe "The if expression" do
  it "evaluates body if expression is true" do
    a = []
    if true
      a << 123
    end
    a.should == [123]
  end

  it "does not evaluate body if expression is false" do
    a = []
    if false
      a << 123
    end
    a.should == []
  end

  # Lots and lots of suff omitted
end

describe "Array#each" do
  it "yields each element to the block" do
    a = []
    x = [1, 2, 3]
    x.each { |item| a << item }.should equal(x)
    a.should = [1, 2, 3]
  end

  # Lots of suff omitted
end

class Document
  
  # ...

  def clone 
    Document.new(title.clone, author.clone, content.clone)
  end
end

describe Document do
  it "should have a functional clone method" do
    doc1 = Document.new("title", "author", "some stuff")
    doc2 = doc1.clone
    doc1.title.should == "title"
    doc1.author.should == "author"
    doc1.content.should == "some stuff"
  end
end

require "document"
 
describe Document do
  it "should not catch fire when you create an instance" do
    Document.new("title", "author", "stuff".should_not == nil)
  end
end


