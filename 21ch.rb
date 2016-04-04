class RepeatBackToMe
  def method_missing(method_name, *args)
    puts "Hey, you just called the #{method_name} method"
    puts "With these argumets: #{args.join('  ')}"
    puts "But there ain't no such method"
  end
end

repeat = RepeatBackToMe
repeat.hello(1, 2, 3,)
repeat.good_bye("for", "now")

class Document
  # Most of the class omitted...

  def method_missing(method_name, *args)
    msg = %Q{
      You tried to call the method #{method_name}
      on an instance of Document. There is no such method.
    }
    raise msg
  end
end

class Document
  # Most of the class omitted...

  def method_mising(method_name, *args)
    File.open("document.error", "a") do |f|
      f.puts("Bad method called: #{method_name}")
      f.puts("with #{args.size} arguments")
    end
    super
  end
end

require "text" # From the text gem

class Document
  include Text

  # Most of the class omitted...

  def method_missing(missing, *args)
    candidates = method_that_sound_like(missing.to_s)

    message = "You called an undefined method: #{missing}."

    unless candidates.empty?
      message += "\nDid you mean #{candidates.join(" or ")}?"
    end
    raise NoMethodError.new(message)
  end

  def methods_that_sound_like(name)
    missing_soundex = Soundex.soundex(name.to_s)
    public_methods.sort.find_all do |existing|
      existing_soundex = Soundex.soundex(existing.to_s)
      missing_soundex == existing_soundex
    end
  end
end

class Document
  # Most of the class omitted...

  def self.const_missing(const_name)
    msg = %Q{
      You tried to reference the constant #{const_name}
      There is no such constant in the Document class.
    }
    raise msg
  end
end

book_author = Author.find( :first,
        :conditions => { :name => "Bilbo Baggins" })

book_author.save

def const_missing(const_name)
  case const_name
  when :Task
    Rake.application.const_warning(const_name)
    Rake::Task
  when :FileTask
    Rake.application.const_warning(const_name)
    Rake::FileTask
  when :FileCreationTask
    Rake.application.const_warning(const_name)
    Rake::FileCreationTask
  when :RakeApp
    Rake.application.const_warning(const_name)
    Rake::Application
  else
    rake_original_const_missing(const_name)
  end
end

def self.const_missing(name)
  file_name = "#{name.to_s.downcase}"
  require file_name
  raise "Underfined: #{name}" unless const_defined?(name)
  const_get(name)
end
