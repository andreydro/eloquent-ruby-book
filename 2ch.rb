class Document
  attr_accessor :writable
  attr_accessor :title, :author, :content
  
  # much of class omitted...
 
  def title=(new_title)
    if @writable
      @title = new_title
    end
  end

  # author = and content= methods omitted...

end

def title=(new_title)
  unless @read_only
    @title = new_title
  end
end

until document.printed?
  document.print_next_page
end

unless @read_only
  @title = new_title
end

@title = new_title unless @read_only

@title = new_title if @writable

document.print_next_page while document.pages_available?

document.print_next_page until document.printed?

fonts = ["courier", "times roman", "helvetica"]
for font in fonts
  puts font
end

font = ["courier", "times roman", "helvetica"]
fonts.each do |font|
  puts font
end

author = case title
         when "War and Peace"
           "Tolstoy"
         when "Romeo and Juliet"
           "Shakespeare"
         else
           "Don`t know"
         end

author = case title
         when "War and Peace" then "Tolstoy"
         when "Romeo and Juliet" then "Shakespeare"
         else "Don`t know"
         end

puts "Sorry Dennis Ritchie, but 0 is true!" if 0

puts "Sorry but 'false' is not false" if "false"

if flag == true
  # do something
end

doc = Docuemnt.new("A question", "Shakespeare", "To be..")
flag = defined?(doc)

until (next_object = get_next_object).nil?
  # do something with the object
end


ret = if @not_before && @not_before > time
        [false, :expired, "not valid before "#@not_before""]
      elsif @not_after && @not_after < time
        [false, :expired, "not valid after "#@not_after""]
      elsif issuer_cert && !verify(issuer_cert.publuc_key)
        [false, :issuer, "#{issuer_cet.subject} is not issuer"]
      else
        [true, :ok, "Valid certificate"]
      end


file = all ? 'specs' : 'latest_specs'

@first_name = '' unless @first_name

@first_name ||= ''

count += 1

