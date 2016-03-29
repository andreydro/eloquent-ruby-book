sum = first + second

result = first + second * (third - fourth)

class Document
  # Most of the class omitted...

  def +(other)
    Document.new(title, author, "#{content} #{other.content}")
  end
end

doc1 = Document.new("Tag Line1", "Kirk", "These are the voyages")
doc2 = Document.new("Tag Line2", "Kirk", "of the star ship ...")

total_document = doc1 + doc2
puts total_document.content

names = []
names << "Rob"
names << "Denise"

class Document
  # Stuff omitted...

  def !
    Document.new(title, author, "It is not true: #{content}")
  end
end

favorite = Document.new("Favorite", "Russ', "Chocolate is best')
 
class Document
  # Most of the class taking a break...

  def +@
    Document.new(title, author, "I am sure that #{@content}")
  end

  def -@
    Document.new(title, author, "I doubt that #{@content}")
  end
end

favorite = Document.new("Favorite", "Russ", "Chocolate is best")
unsure = -(+favorite)

class Document
  # Most of the class omitted...
  
  def [](index)
    words[index]
  end
end

def +(other)
  Document.new(title, author, "#{content} #{other.content}")
end

doc = Document.new("hi", "russ", "hello")
new_doc = doc + "out there!"

def +(other)
  if other.kind_of?(String)
    return Document.new(title, author, "#{content} #{other}")
  end
  Document.new(title, author, "#{content} #{other.content}')
end

department = employee_1 + employee_2

division = department_1 + department_2

now = Time.now

one_minute_from_now = now + 60

"The value of n is %d" % 42

day = 4
month = 7
year = 1776

file_name = "file_%02d%02d%d" % [day, month, year]

