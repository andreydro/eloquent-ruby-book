class SimpleBaseClass
  def self.inherited(new_subclass)
    puts "Hey #{new_subclass} is now a subclass of #{self}"
  end
end

class ChildClassOne < SimpleBaseClass
end

class PlainTextReader < DocumentReader
  def self.can_read?(path)
    /.*\.txt/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    File.open(path) do |f|
      title = f.readline.chomp
      author = f.readline.chomp
      content = f.read.chomp
      Document.new(title, author, content)
    end
  end
end

class YAMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.yaml/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    # Lots of simple Yeaml stuff omitted
  end
end

class XMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.xml/ =~ path
  end

  def initialize(path)
    @path = path
  end

  def read(path)
    # lots of complicated XML stuff omtted
  end
end

class DocumentReader

  class << self
    attr_reader :reader_classes
  end

  @reader_classes = []

  def self.read(path)
    reader = reader_for(path)
    return nil unless reader
    reader.read(path)
  end

  def self.reader_for(path)
    reader_class = DocumentReader.reader_classes.find do |klass|
      klass.can_read?(path)
    end
    return reader_class.new(path) if reader_class
    nil
  end

  # one critical bit omitted
end

def self.inherited(subclass)
  DocumentReader.reader_classes << subclass
end

module WritingQuality
  def self.included(klass)
    puts "Hey, I've been included in #{klass}"
  end

  def number_of_cliches
    # Body of method omitted...
  end
end

module UsefulInstanceethod
  def an_instance_method
  end
end

module UsefulClassMethod
  def a_class_method
  end
end

class Host
  include UsefulInstanceMethods
  extend UsefulClassMethod
end

module UsefulMethods
  module ClassMethods
    def a_class_method
    end
  end

  def self.included(host_class)
    host_class.extend(ClassMethods)
  end

  def an_instance_method
  end

  # Rest of the module deleted...
end

class Host
  include UsefulMethods
end

at_exit fo
  puts "Have a nice day!"
end

proc_object = proc do |event, file, line, id, binding, klass|
  puts "#{event} in #{file}/#{line} #{id} #{klass}"
end

set_trance_func(proc_object)

require "date"

class DocumentReader
  # Stuff omitted...
end

class PlainTextReader < DocumentReader
  # Stuff omitted...
end

class YAMLReader < DocumentReader
  # stuff omitted...
end

require "document_reader"

require "plaintext_reader"
require "xml_reader"
require "yaml_reader"

class AsianDocumentReader <DocuemntReader
  def self.can_read?(path)
    false
  end

  $ Lots of code dealing with Asian languages...
end

require "test/unit"

class SimpleTest < Test::Unit::TestCase
  def test_addition
    assert_equal 2, 1 + 1
  end
end

at_exit do
  unless $! || Test::Unit.run?
    exit Test::Unit::AutoRunner.run
  end
end
