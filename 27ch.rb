#!/usr/bin/env ruby

require "rexml/document"

File.open("fellowship.xml") do |f|
  doc = REXML::Document.new(f)
  author = REXML::XPath.each(doc, "/document/author")
      puts author.text
  end

#!/usr/bin/env ruby

require "rexml/document"

File.open("fellowship.xml") do |f|
  doc = REXML::Document.new(f)
  REXML::XPath.each(doc, "/document/chapter/title") do |title|
    puts title.text
  end
end

#!/usr/bin/env ruby

require "rexml/document"

File.open("fellowship.xml") do |f|
  doc = REXML::Document.new(f)
  REXML::XPath.each(doc, "/document/author") do |author|
    author.text = "J.R.R. Tolkien"
  end
  puts doc
end

require "rexml/document"

class XmlRipper
  def initialize(&block)
    @before_action = proc {}
    @path_actions = {}
    @after_action = proc {}
    instance_eval(&block) if block
  end

  def on_path(path, &block)
    @path_actions[path] = block
  end

  def before(&block)
    before_action = block
  end

  def after(&block)
    @after_action = block
  end

  def run(xml_file_path)
    File.open(xml_file_path) do |f|
      document = REXML::Document.new(f)
      @before_action.call(document)
      run_path_actions(document)
      @after_action.call(document)
    end
  end

  def run_path_actions(document)
    @path_actions.each do |path, block|
      REXML::XPath.each(document, path) do |element|
        block.call(element)
      end
    end
  end
end

ripper = XmlRipper.new do |r|
  r.on_path("/document/author") { |a| puts a.text }
  r.on_path("/document/chapter/title"){ |t| puts t.text }
end

ripper.run("fellowship.xml")

ripper = XmlRipper.new do
  on_path("/document/author") do |author|
    author.text = "J.R.R. Tolkien"
  end
  after { |doc| puts doc }
end

ripper.run("fellowship.xml")

class XmlRipper
  def initialize_from_file(path)
    instance_eval(File.read(path))
  end

  # Rest of the class omitted...
end

ripper = XmlRipper.new
ripper.initialize_from_file("fix_author.ripper")
ripper.run("fellowship.xml")

r = XmlRipper.new
r.initialize_from_file(ARGV[0])
r.run(ARGV[1])

# Correct a mistake

on_path("/document/author") do |author|
  author.text = "J.R.R. Tolkien" if author.text =~ /Tolkien/
end

# Print out the whole document when done

after { |doc| puts doc }

class XmlRipper

  # Rest of the class omitted...

  def method_missing(name, *args, &block)
    return super unless name.to_s =~ /on_.*/
    parts = name.to_s.split( "_")
    parts.shift
    xpath = parts.join( "/" )
    on_path(xpath, &block)
  end
end

# RSpec

describe "Array@each" do
  it "yields each element to the block" do
    a = []
    x = [1, 2, 3]
    x.each { |item| a << item }.should equal(x)
    a.should == [1, 2, 3]
  end

  # Lots of stuff omitted
end

# Rakefile

task :default => [ :install_program, :install_data]

task :install_data => :installation_dir do
  cp "fints.dat", "installation"
end

task :install_program => [ :installation_dir] do
  cp "document.rb", "installation"
end

task :installation_dir do
  mkdir_p "installation"
end

class Book < ActiveRecord::Base
  has_many :authors
  belongs_to :publisher
end

class AddBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.integer :publisher_id
    end
  end

  def self.down
    drop_table :books
  end
end
