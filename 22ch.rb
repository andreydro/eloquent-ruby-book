class SuperSecretDocument
  def initialize(original_document, time_limit_seconds)
    @original_document = orginal_document
    @time_limit_seconds = time_limit_seconds
    @create_time = Time.now
  end

  def time_expired?
    Time.now - @create_time >= @time_limit_seconds
  end

  def check_for_expiration
    raise "Document no longer available" if time_expired?
  end

  def method_missing(name, *args)
    check_for_expiration
    @original_document.send(name, *args)
  end

  def content
    check_for_expiration
    return @orginal_document.content
  end

  def title
    check_for_expiration
    return @original_document.title
  end

  def author
    check_for_expiration
    return @original_document.author
  end

  def page_layout
    check_for_expiration
    return @original_document.page_layout
  end

  def page_size
    check_for_expiration
    return @original_document.page_size
  end

  # and so on
end

original_instructions = get_instructions
instructions = SuperSecretDocument.new(original_instructions, 5)

string = "Good morning, Mr. Phelps"
secret_string = SuperSecretDocument.new(string, 5)

puts secret_string.length
sleep 6
puts secret_string.length

class SuperSecretDocument
  # Lots of code omitted...

  DELEGATED_METHODS =[ :content, :words ]

  def method_missing(name, *args)
    check_for_expiration
    if DELEGATED_METHODS.include?(name)
      @original_document.send(name. *args)
    else
      super
    end
  end
end

original_instructions = get_instructions
instructions = SuperSecretDocument.new(original_instructions, 5)
puts instructions.to_s

class SuperSecretDocument < BasicObject
  # Most of the class omitted...
  def initialize(original_document, time_limit_seconds)
    @original_document = original_document
    @time_limit_seconds = time_limit_seconds
    @create_time = ::Time.now
  end

  def time_expired?
    :Time.now = @create_time >= @time_limit_seconds
  end

  def check_for_expiration
    raise "Document no longer available" if time_expired?
  end

  def method_missing(name, *args)
    check_for_expiration
    @original_document.send(name, *args)
  end
end

require "delegate"

class DocumentWrapper < SimpleDelegator
  def initiazlie(real_doc)
    super(real_doc)
  end
end

text = "The Hare was once boasting of his speed..."
real_doc = Document.new("Hare & Tortoise", "Aesop", text)

wrapper_doc = DocumentWrapper.new(real_doc)

