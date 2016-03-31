class Document
  CLICHES = [/play fast and loose/,
	              /make no mistake/,
	              /does the trick/,
	              /off and running/,
	              /my way or the highway/ ]

  def number_of_cliches
    CLISHES.inject(0) do |count, phrase|
			count += 1 if phrase =~ content
			count
    end
  end

  # Rest of the class omitted...
end

class ElectronicBook < ElectronicText
  # Lots of complicated stuff omitted...
end

module WritingQuality

  CLICHES = [/play fats and loose/,
	                  /make no mistake/,
	                  /does the trick/,
	                  /off and running/,
	                 /my way or the highway/]
  def number_of_cliches
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count
    end
  end
end

class Document
  include WritingQuality

  # Lots of stuff omitted...
end

class ElectronicBook < ElectronicText
  include WritingQuality

  # Lots of stuff omitted...
end

text = "my way or the highway does the trick"
my_tome = Document.new("Hackneyed", "Russ", text)
puts my_tome.number_of_cliches

my_ebook = ElectronicBook.new("EHackneyed", "Russ", text)
puts my_ebook.number_of_cliches

module ProjectManagement
  # Lots of boring stuff omitted
end

module AuthorAccountTracking
  # Lots of even more boring stuff omitted
end

class ElectronicBook < ElectronicText
  include WritingQuality
  include ProjectManagement
  include AuthorAccountTracking

  # Lots of stuff omitted...
end

module Finders
  def find_by_name(name)
    # Find a document by name...
  end

  def find_by_id(doc_id)
  # Find a document by id
  end
end

class Document
  # Most of the class omitted...
  class << self
    include Finders
  end
end

war_and_peace = Document.find_by_name("war_and_peace")

class Document
  extend Finders

  # Most of the class omitted...
end

Object::WritingQuality::Document

class Document
  include WritingQuality

  # Rest of the class omitted...
end

class Political < Document
  def number_of_cliches
    0
  end

  Rest of the class omitted...
end

module PoliticalWritingQUality
  # ...
  # ...

  def number_of_cliches
    0
  end
end

class PoliticalBook < Document
  include WritingQuality
  include PoliticalWritingQuality

  # Lots of stuff omitted...
end

# Methods to measure writing quality
# Uses the content method of the including class.
module WritingQuality

  # Lots of stuff omitted...

end

Document::WritingQuality::PoliticalWritingQuality::PoliticalBook

class Document
  include DataMapper::Resource

  property :id, Integer, :resial => true
  property :title. String
  property :content, String
  property :author, String
end

module ActionView

  # Huge amounts of code and helpful documentation omitted...
  module Helpers
    module FormHelper
      def label(object_name, method, text = nil, options = {})
        # ...
      end

      def radio_button(object_name, method, tag_value, options = {})
        # ...
      end
    end
  end
end

module ErrorCode
  OK          = 0
  ERROR       = 1
  INTERNAL    = 2
  PERM        = 3
  ABORT       = 4
  BUSY        = 5
  LOCKED      = 6
end

class SomeSQLiteApplication
  include ErrorCode

  def print_status_message(status)
    if status == ERROR
      puts "It failed!"
    elsif status == OK
      puts "It worcked!"
    else
      puts "Status was #{status}"
    end
  end
end

# Done
