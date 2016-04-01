def run_that_block(&that_block)
  puts "About to run the block"
  that_block.call
  puts "Done running the block"
end

class DocumentSaveListener
  def on_save(doc, path)
    puts "Hey, I`ve been saved!"
  end
end

class DocumentLoadListener
  def on_load(doc, path)
    puts "Hey I`ve been loaded!"
  end
end

class Document

  attr_accessor :load_listener
  attr_accessor :save_listener

  # Most of the class omitted...

  def on_save(&block)
    @save_listener = block
  end

  def on_load(&block)
    @load_listener = block
  end

  def load(path)
    @content = File.read(path)
    load_lisnener.on_load(self, path) if load_lisnener
  end

  def save(path)
    File.open(path, "w") { |f| f.print(@contents) }
    save_listener.on_save(self, path) if save_listener
  end
end

doc = Document.new("Example", "Russ", "It was a dark...")
doc.load_listener = DocumentLoadListener.new
doc.save_listener = DocumentSaveListener.new

doc.load("example.txt")
doc.save("example.txt")

my_doc = Document.new("Block Based Example", "russ", "")

my_doc.on_load do |doc|
  puts "Hey, I've been loaded!"
end

my_doc.on_save do |doc|
  puts "Hey, I've been saved!"
end

class ArchivalDocument
  attr_reader :title, :author

  def initialize(title, author, path)
    @title = title
    @authpr = author
    @path = path
  end

  def content
    @content ||= File.read(@path)
  end
end

class BlockBasedArchivalDocument
  attr_reader :title, :author

  def initialize(title, author, &block)
    @title = title
    @author = author
    @initializer_block = block
  end

  def content
    if @initializer_block
      @content = @initializer_block.call
      @initializer_block = nil
    end
    @content
  end
end

file_doc = BlockBasedArchivalDocument.new("file", "russ") do
  File.read("some_text.txt")
end

class Document
  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "LOADED: #{path}"
  end

  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "Saved: #{path}"
  end

  attr_accessor :title, :author, :content

  def initialize(title, author, content="")
    @title = title
    @author = author
    @content = content
    @save_listener = DEFAULT_LOAD_LISTENER
    @load_listener = DEFAULT_LOAD_LISTENER
  end

  # Rest of the class omitted...
end

from_proc_new = Proc.new { puts "hello from a block"}

def some_method(doc)
  big_array = Array.new(10000000)

  # Do something with big_array...

  # And now get rid of it!

  big_array = nil

  doc.on_load do |d|
    puts "Hey, I've been loaded!"
  end
end

it "should know how many words it contatins" do
  doc = Document.new("example", "russ", "hellow world")
  doc.word_count.should == 2
end

class DocumentController < ActionController::Base
  before_filter do |controller|
    # Do something before each action...
  end

  # Rest of the controller...
end

class DocumentVersion < ActiveRecord::Base
  after_destroy do |doc_version|
    # My Document is gone!
  end
end

# some Copistrano

def task(name, options={}, &block)
  name = name.to_sym
  raise ArgumentError, "expected a block" unless block_given?

  # Some code omitted...

  task[name] = TaskDefinition.new(name, self,
    {:desc => next_description(:reset)}.merge(options), &block)

  # Some more code deleted...
end
