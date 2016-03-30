class DocumentIdentifier
  attr_reader :folder, :name
  
  def initialize(folder, name)
    @folder = folder
    @name = name
  end

  def ==(other)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end
end

class ContractIdentifier < DocumentIdentifier
end

doc_id = DocumentIdentifier.new("contracts", "Book Deal")
doc_id = ContractIdentifier.new("contracts", "Book Deal")


x.equal?(y)

class DocumentPointer
  attr_reader :folder, :name

   def initialize(folder, name)
     @folder = folder
     @name = name   
   end

   def ==(other)
     return false unless other.respond_to?(:folder)
     return false unless other.respond_to?(:name)
     folder == other.folder && name == other.name
   end
end

doc_id = DocumentIdentifier.new("secret/area51", "phone list")
pointer = DocumentPointer.new("secret/area51", "phone list")

pointer == doc_id

class VersionedIdentifier < DocumentIdentifier
  attr_reader :version

  def initialize(folder, name, version)
    super(folder, name)
    @version = version
  end

  def ==(other)
    if other.instance_of? VersionedIdentifier
      other.folder == folder &&
      other.name == name &&
      other.version == version
    elsif other.instance_of? DocumentIdentifier
      other.folder == folder && other.name == name
    else
      false
    end
  end

  def as_document_identifier
    DocumentIdentifier.new(folder, name)
  end
end

versioned1 = VersionedIdentifier.new("specs", "bfg9k", "V1")
versioned2 = VersionedIdentifier.new("specs", "bfg9k", "V2")
unversioned = DocumentIdentifier.new("specs", "bfg9k")

versioned1 == unversioned  # true
unversioned == versioned2  # true

versioned1 == versioned2    # false

location = "area 51"

case location
when /area.*/
  # ...
when /roswell.*/
  # ...
else
  # ...
end

hash = {}
document = Document.new("cia", "Roswell", "story")
first_id = DocumentIdentifier.new("public", "CoverStory")

hash[first_id] = document

second_id = DocumentIdentifier.new("public", "CoverStory"')
the_doc_again = hash(second_id)

class DocumentIdentifier

  # Code omitted...

  def hash
    folder.hash ^ name.hash
  end

  def eql?(other)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end
end

class DisArray
  
  attr_reader :my_array
  
  def initialize
    @my_array = []
  end

  def ==(other)
    return false unless other.kind_of?(DisArray)
    @my_array = other.my_array
  end

  def eql?(other)
    return false unless other.kind_of?(DisArray)
    @my_array.eql?(other.my_array)
  end

  def hash
    @my_array.hash
  end

  # Rest of the class omitted...
end

class RomanNumerals
  include Comparable

  # Actual guts of the class omitted...
 
  def <=>(other)
    # Return -1, 0, or 1...
  end
end

the_object = 3.14159

case the_object
when String
  puts "It`s a string"
when Float
  puts "It`s a float"
when Fixnum
  puts "It`s a fixnum"
else
  puts "Dunno!"
end


