class FormLetter < Document

  def replace_word(old-word, new_word)
    @content.gsub!(old_word, "#{new_word}")
  end

  def replace_firstname(new_first_name)
    replace_word("FRISTNAME", new_first_name)
  end

  def replace_lastname(new_last_name)
    replace_word("LASTNAME", new_last_name)
  end
end

offer_letter = FormLetter.new("Special Offer", "Acme Inc",
  %q{
      Dear Mr. LASTNAME

      Are you troubled by the heartache of hangnails?
      ...

      FRISTNAME, we look forward to hearing from you.
    })

offer_letter.replace_word("FRISTNAME", "Russ")
offer_letter.replace_word("LASTNAME", "Olsen")

class FormLetter < Document
  def replace_word(old_word, new_word)
    @content.gsub!(old_word, "#{new_word}")
  end

  def method_missing(name, *args)
    string_name = name.to_s
    return super unless string_name =~ /^replace_\w+/
    old_word = extract_old_word(string_name)
    replace_word(old_word, args.first)
  end

  def extract_old_word(name)
    name_parts = name.split("_")
    name_parts[1].upcase
  end
end

letter = FormLetter.new("Example", "Acme", "The word is WORD")
letter.replace_word("Abracadabra") # wrong number of arguments

def respond_to?(name)
  string_name = name.to_s
  return true if string_name =~ /^replace_\w+/
  super
end

require "ostruct"

author = OpenStruct.new
author.first_name = "Stephen"
author.last_name = "Hawking"

puts author.first_name
put author.last_name

def method_missing(mid, *args)
  mname = mid.id2name
  len = args.length

  if mname =~ /=$/
    # Some error handling deleted...
    mname.chop!
    self.new_ostruct_member(mname)
    @table[mname.intern] = args[0]
  elsif len == 0
    @table[mid]

  else
    raise NoMethodError,
      "undefined method `#{mname} for #{self}", caller(1)
  end
end

class Author < ActiveRecord::Base
end

author_named_henry = Author.find_by_fname("Henry")
james_family_authors = Author.find_by_lname("James")

