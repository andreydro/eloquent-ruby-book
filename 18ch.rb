class SomeApplication
  # ...

  def do_something
    doc = Document.new("resume.txt")

    # Do something interesting with the document

    doc.save
  end
end

class SomeApplication

  def initialize(logger)
    @logger = logger
  end

  def do_something
    with_logging("load") { @doc = Document.load("resume.txt") }

    # Do something with the document...

    with_logging("save") {@doc.save}
  end

  def with_logging(description)
    begin
      @logger.debug("Staring #{description}")
      return_value = yield
      @logger.debug("Completed #{description}")
      return_value
    rescue
      @logger.error("#{decription} failed!")
      raise
    end
  end
end

class SomeApplication
  def do_something_silly
    with_logging("Compute miles in a light year") do
      186000 * 60 * 60 * 24 * 365
    end
  end
end

def log_before(description)
  @logger.debug("Starting #{description}")
  yield
end

def log_after(description)
  yield
  @logger.debug("Done #{description}")
end

class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content = "")
    @title = title
    @author = author
    @content = content
    yield(self) if block_given?
  end

  # Rest of the class omitted...
end

new_doc = Document.new("Us Constitution", "Madison", "") do |d|
  d.content << "We the people"
  d.content << "In order to form a more perfect union"
  d.content << "provide for the common defense"
end

def with_database_connection(connection_info)
  connection = Database.new(connection_info)
  begin
    yield(connection)
  ensure
    connection.close
  end
end

with_logging("update") do
  employee.load
  employee.status = :retired
  employee.save
end

# no open file here

File.open("/etc/passwd") do |f|
  # File open here!
  # Begin cracking the passwords on Russ' computer...
end

# The password file is guaranteed to be closed here.

class Migration
  # Most of the class omitted...

  def say(message, subitem=false)
    write "#{subitem ? "    ->" : "--"} #{message}"
  end

  def say_with_time(message)
    say(message)
    result = nil
    time = Benchmark.measure { result = yield }
    say "%.4fs" % time.real, :subitem
    say("#{result} rows", :subitem) if result.is_a?(Integer)
    result
  end
end

# Done
