class Document

  @@default_paper_size = :a4

  def self.default_paper_size
    @@default_paper_size
  end

  def self.default_paper_size=(new_size)
    @@default_paper_size = new_size
  end

  attr_accessor :title, :author, :content
  attr_accessor :paper_size
  
  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
    @paper_size = @@default_paper_size
  end

  # Rest of the class omitted...
end


class Resume < Document
  @@default_font = :arial

  def self.default_font=(font)
    @@default_font = font
  end

  def self.default_font
    @default_font
  end

  attr_accessor :font

  def initialize
    @font = @@default_font
  end
  
  # Rest of the class omitted...
end

class Presentation < Document
  @@default_font = :nimbus

  def self.default_font=(font)
    @@default_font = font
  end

  def self.default_font
    @@default_font
  end

  attr_accessor :font

  def initialize
    @font = @@default_font
  end

  # Rest of the class omitted...
end

class Document
  @@default_font = :times

  # Rest of the class omitted...
end

require "document"
require "resume"
require "presentation"

class Document

  @default_font = :times

  def self.default_font=(font)
    @default_font = font
  end

  def self.default_font
    @default_font
  end

  # Rest of the class omitted...
end


def initialize(title, author)
  @title = title
  @author = author
  @font = Document.default_font
end

class Presentation < Document

  @default_font = :nimbus

  class << self
    attr_accessor :default_font
  end

  def initialize(title, author)
    @title = title
    @author = author
    @font = Presentation.default_font
  end

  # most of the class omitted...
end


class Document

  @default_font = :times

  class << self
    attr_accessor :default_font
  end

  # Rest of the class omitted...
end

class Person < ActiveRecord::Base
  after_save :handle_after_save

  def handle_after_save
    # Do something after the record is saved...
  end
end


class HTTP
  # Lots of code omitted...
end
@@schemes["HTTP"] = HTTP

class MailTo
  # Lots of code omitted...
end

@@schemes["MAILTO"] = MailTo

module URI
  # ...

  @@schemes = {}

end

module URI
  class HTTP
    # lots of code omitted...
  end

  @@schemes["HTTP"] = HTTP
end


