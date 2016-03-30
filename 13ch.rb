stub_printer = stub :available? => true, :render => nil

stub_printer.available?
stub_printer.render

stub_font = stub :size => 14, :name => "Courier"

puts stub_printer.class
puts stub_font.class

hand_built_stub_printer = Object.new

def hand_built_stub_printer.available?
  true
end

def hand_built_stub_printer.render(content)
  nil
end

uncooperative = "Don`t ask my class"

def uncooperative.class
  "I'm not telling"
end

puts uncooperative.class

hand_built_stub_printer = Object.new

class << hand_built_stub_printer
  def available?
    true
  end

  def render 
    nil
  end
end

singleton_class = class << hand_built_stub_printer
  self
end

my_object = Document.new("War and Peace", "Tolstoy",
                         "All happy families...")

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

my_object.explain

my_object = Document

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

my_object.explain

def Document.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

class Document
  class << self
    def find_by_name(name)
      # Find a document by name...
    end

    def find_by_id(doc_id)
      # Find a document by id
    end
  end
end

class Author < ActiveRecord::Base
end

my_table_name = Author.table_name

require "date"
xmax = Date.civil(2010, 12, 25)
xmas = Date.ordinal(2010,359)
xmas = Date.commercial(2010, 51, 6)

describe "Singleton method in stubs" do
  it "is just a demonstration of stubs as singleton method" do
    stub_printer = stub :available? => true, :render => nil
    pp stub_printer.singletion_method
  end
end

class Document
  def self.create_test_document(length)
    Document.new("test", "test", "test" * length)
  end

  # ...
end

book = Document.create_test_document(10000)

longer_doc = book.class.create_test_document(20000)

class Parent 
  def self.who_am_i
    puts "The value of self is #{self}"
  end
end

class Child < Parent
end


