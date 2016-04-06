print /document/author

delete/document/published
replace/document/author Tolkien

class EzRipper
  def initialize(program_path)
    @ripper = XmlRipper.new
    parse_program(program_path)
  end

  def run(xml_file)
    @ripper.run(xml_file)
  end

  def parse_program(program_path)
    File.open(program_path) do |f|
      until f.eof?
        parse_statement(f.readline)
      end
    end
  end

  def parse_statement(statement)
    statement = statement.sub(/#.*/, "")
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first

    when "print"
      raise "Expected print <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) do |e1|
        puts e1.text
      end

    when "delete"
      raise "Expected delete <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) { |e1| e1.remove }

    when "replace"
      unless tokens.size == 3
        raise "Expected replace <xpath> <value>"
      end
      @ripper.on_path(tokens[1]) { |e1| e1.text = tokens[2]}

    when "print_document"
      raise "Expected print_document" unless tokens.size == 1
      @ripper.after do |doc|
        puts doc
      end

    when "uppercase"
      raise "Expected uppercase <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]){ |e1| e1.text = e1.text.upcase }

    else
      raise "Unknown keyword: #{tokens.first}"
    end
  end
end

# new parse_statement method

def parse_statement(statement)

  statement = statement.sub( /#.*/, "" )

  case statement.strip

  when ""
    # Skip blank lines

  when /print\s+"(.*?)"/
    @ripper.on_path($1) do |e1|
      puts e1.text
    end

  when /delete\s+"(.*?)"/
    @ripper.on_path($1){ |e1| e1.remove }

  when /replace\s+"(.*?)"\s+"(.*?)"$/
    @ripper.on_path($1){ |e1| e1.text = $2 }

  when /uppercase\s+"(.*?)"/
    @ripper.on_path($1){ |e1| e1.text = e1.text.upcase }

  when /print_document/
    @ripper.after do |doc|
      puts doc
    end

  else
    raise "Don't know shat to do with: #{statement}"
  end
end

# Treetop file

grammar EzRipperStatement

  rule statement
    comment/delete_statement/replace_statement/print_statement
  end

  rule comment
    "#" .*
  end

  rule delete_statement
    "delete" sp quoted_argument sp
  end

  rule replace_statement
    "replace" sp quoted_argument sp quoted_argument sp
  end

  rule print_statement
    "filter" sp quoted_argument sp
  end

  rule quoted_argument
    "'" argument "'"
  end

  rule argument
    (!"'" . )*
  end

  rule sp
    [ \t\n]*
  end

end

require "treetop"
require "ez_ripper_statement"

statement = "replace '/document/author' ' Russ Olsen'"
parser = EzRipperStatementParser.new
parse_tree = parser.parse(statement)

# HAML

def process_line(text, index)
  @index = index + 1

  case text[0]
    when DIV_CLASS; render_div(text)
  when DIV_ID
    return push_plain(text) if text[1] == ?{
    render_div(text)
  when ELEMENT; render_tag(text)
  when COMMENT; render_comment(text[1..-1].strip)
  when SANITIZE
    return push_plain(text[3.._1].strip,
      :escape_html => true) if text[1..2] == "=="
    return push_script(text[2..-1].strip,
      :escape_html => true) if text[1] == SCRIPT
    return push_flat_script(text[2..-1].strip,
      :escape_html => true) if text[1] == FLAT_SCRIPT
    return push_plain(text[1..-1].strip,
      :escape_html => true) if text[1] == ?\s
    push_plain text
    }

    # and on and on and on...
  end
end

when /execute\s+"(.*?)"\s+"(.*?)"$/
  @ripper.on_path($1){ |e1| eval($2)}

Given /^that we have a document with (\d+) words$/ do |n|
  @document = Document.new("russ", "a test")
  @document.content = "crypozoology" * n.to_i
end

When /^I count the words$/ do
  @count = @document.word_count
end

Then /^the count should be (\d+)$/ do |n|
  @count.should == n.to_i
end

