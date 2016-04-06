class Paragraph
  attr_accessor :font_name, :font_size, :font_emplasis
  attr_accessor :text

  def initialize(font_name, font_size, font_emplasis, text ="")
    @font_name = font_name
    @font_size = font_size
    @font_emphasis = font_emphasis
    @text = text
  end

  def to_s
    @text
  end

  # Rest of the class omitted...
end

class StructuredDocument
  attr_accessor :title, :author, :paragraphs

  def initialize(title, author)
    @title = title
    @author = author
    @paragraphs = []
    yield(self) if block_given?
  end

  def <<(paragraph)
    @paragraph << paragraph
  end

  def content
    @paragraphs.inject(" "){ |text,para| "#{text}\n#{para}"}
  end

  # ...
end

russ_cv = StructuredDocument.new("Resume", "RO") do |cv|
  cv << Paragraph.new(:nimbus, 14, :bold, "Russ Olsen")
  cv << Paragraph.new(:nimbus, 12, :italic, "1313 Moking Bird Lane")
  cv << Paragraph.new(:nimbus, 12, :none, "russ@russolsen.com")
  # .. and so on
end

class Resume < StructuredDocument
  def name(text)
    paragraph = Paragraph.new(:nimbus, 14, :bold, text)
    self << paragraph
  end

  def address(text)
    paragraph =Paragraph.new(:nimbus, 12, :italic, text)
    self << paragraph
  end

  def email(text)
    paragraph = Paragraph.new(:nimbus, 12, :none, text)
    self << paragraph
  end

  # and so on
end

russ_cv = resume.new("russ", "resume") do |cv|
  cv.name("Russ Olsen")
  cv.address("1313 Mocking Bird Lane")
  cv.email("russ@russolsen.com")

  # etc...
end

class Instructions < StructuredDocument
  def introduction(text)
    paragraph = Paragraph.new(:mono, 14, :none, text)
    self << paragraph
  end

  def warning(text)
    paragraph = Paragraph.new(:arial, 22, :bold, text)
    self << paragraph
  end

  def step(text)
    paragraph = Paragraph.new(:nimbus, 14, :none, text)
    self << paragraph
  end

  # and so on
end

class Instructions < StructuredDocument
  paragraph_type(:introduction,
    :font_name => :arial,
    :font_size => 18,
    :font_emphasis => :italic)

  # and so on
end

class StructuredDocument
  def self.paragraph_type(paragraph_name, options)
    # What do we do in here?
  end

  # ...
end

class StructuredDocument

  def self.paragraph_type(paragraph_name, options)

    name = options[:font_name] || :arial
    size = options[:font_size] || 12
    emphasis = options[:font_emphasis] || :normal

    code = %Q{
    def #{paragraph_name}(text)
      p = Paragraph.new(:#{name}, #{size}, :#{emphasis}, text)
      self << p
    end
  }
  class_eval(code)
  end

  # ...
end

def introduction(text)
  p = Paragraph.new(:arial, 18, :italics, text)
  self << p
end

class StructuredDocument
  def self.paragraph_type(paragraph_name, options)
    name = options[:font_name] || :arial
    size = options[:font_size] || 12
    emphasis = options[:font_emphasis] || :none

    define_method(paragraph_name) do |text|
      paragraph = Paragraph.new(name, size, emphasis, text)
      self << paragraph
    end
  end

  # ...
end

class StructuredDocument
  # Rest of the class omitted...

  def self.privatize
    private :content
  end
end

class BankStatement < StructuredDocument
  paragraph_type( :bad_news,
    :font_name => :arial,
    :font_size => 60,
    :font_emphasis => :bold)

  privatize
end

class StructuredDocument

  # Rest of the class omitted...

  def self.disclaimer
    "This document is here for all to see"
  end

  def self.privatize
    private :content

    def self.disclaimer
      "This document is a deep, dark secret"
    end
  end
end

class BankStatement < StructuredDocument
  paragraph_type( :bad_news,
    :font_name => :arial,
    :font_size => 60,
    :font_emphasis => :bold)

  privatize
end

class Object
  def self.simple_attr_reader(name)
    code = "def #{name}; @#{name}; end"
    class_eval(code)
  end
end

class Object
  def self.simple_attr_writer(name)
    method_name = "#{name}="
    define_method(method_name) do |value|
      variable_name = "@#{name}"
      instance_variable_set(variable_name, value)
    end
  end
end

class Automobile > ActiveRecord::Base
  has_one :manufacturer
end

my_car = Automobile.find(:first)

class DocumentWrapper
  extend Forwardable

  def_delegators :@real_doc, :title, :author, :content

  def initialize(real_doc)
    @real_doc = real_doc
  end
end

real_doc = Document.new("Two Cities", "Dickens", "It was...")
wrapped_doc = DocumentWrapper.new(real_doc)

puts wrapped_doc.title
puts wrapped_doc.author
puts wrapped_doc.content

module Forwardable
  # Lots of code deleted...

  def def_instance_delegator(accessor, method, ali = method)
    str = %{
      def #{ali}(*args, &block)
        #{accessor}.__send__(:#{method}, *args, &block)
      end
    }
    module_eval(str, __FILE__, line_no)
  end
end

omlette_howto = Instructions.new("Russ", "Omlettes") do |i|
  i.warning("Careful of those sharp egg shells!")
end

