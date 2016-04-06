class MostlyEmpty
  puts "hello from inside the class"
end

class MostlyEmpty
  puts "The value of self is #{self}"
end

class LessEmpty
  pp instance_methods(false)

  def do_something
    puts "I'm doing something!"
  end

  pp instance_methods(false)
end

class TheSameMethodTwice

  def do_something
    puts "first version"
  end

  # In between method definitions

  def do_something
    puts "second version"
  end
end

twice = TheSameMethodTwice.new
twice.do_something

class TheSameMethodTwice
  def do_something
    puts "first version"
  end
end

class TheSameMethodTwice
  def do_something
    puts "second version"
  end
end

class Document

  # Lots of code omitted...

  def save(path)
    File.open(path, "w") do |f|
      f.puts(encrypt(@title))
      f.puts(encrypt(@author))
      f.puts(encrypt(@content))
    end
  end

  if ENCRYPTION_ENABLED
    def encrypt(string)
      string.tr("a-zA-Z", "m-za-lM-ZA-L")
    end
  else
    def encrypt(string)
      string
    end
  end
end


ENCRYPTION_ENABLED = true

class Document

  # Most of the class left behind...

  def self.enable_encryption(enabled)
    if enabled
      def encrypt_string(string)
        string.tr("a-zA-A", "m-za-lM-ZA-L")
      end
    else
      def encrypt_string(string)
        string
      end
    end
  end

  enable_encryption(ENCRYPTION_ENABLED)
end

Document.enable_encryption(false)

class Document
  def char_at(index)
    @content[index]
  end
end

class Document
  # Lots of stuff omitted...

  if RUBY_VERSIOON >= "1.9"
    def char_at(index)
      @content[index]
    end
  else
    def char_at(index)
      @content[index].chr
    end
  end
end

class Document
  def self.reload
    load(___FILE___)
  end

  # Rest of the class omitted...
end

class Document
  def self.reload
    remove_instance_methods
    load(___FILE___)
  end

  def self.remove_instance_methods
    instance_methods(false).each do |method|
      remove_method(method)
    end
  end

  # Rest of the class omitted...
end

# Rspec

describe Document do
  before :each do
    @doc = Document.new("test", "tester", "this is a test")
  end

  it "should encrypt if encryption is enabled" do
    Document.enable_encryption(true)
    @doc.encrypt_string("abc").should_not == "abc"
  end

  it "should not encrypt if encryption os disabled" do
    Document.enable_encryption(false)
    @doc.encrypt_string("abc").should == "abc"
  end
end
