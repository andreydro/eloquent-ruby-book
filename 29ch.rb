require "mp3info"

Mp3Info.open("money.mp3") do |info|
  puts "title: #{info.tag.title}"
  puts "artist: #{info.tag.artitst}"
  puts "album: #{info.tag.album}"
end

Gem::Specification.new do |s|
  s.name = "document"
  s.version = "1.0.1"
  s.authors = ["Russ Olsen"]
  s.date = %q{2010-01-01}
  s.description = "Document - Simple document class"
  s.summary = s.description
  s.email = "russ@russolsen.com"
  s.files = ["README", "lib/document.rb", 'spec/document_spec.rb']
  s.homepage = "http://www.russolsen.com"
  s.has_rdoc = true
  s.rubyforge_project = "simple_document"
end

s.add_dependency("text", "= 0.1.13")

s.bindir = "bin"
s.executables = ["spellcheck"]

require "spec/rake/spectask"
require "rake/gempackagetask"

task :default => [:spec, :gem]

Spec::Rake:SpecTask.new do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

gem_spec = Gem::Specification.new do |s|
  s.name = "document"
  s.version = "1.0.1"
  s.authors = ["Russ Olsen"]
  s.date = %q{2010-05-23}
  s.description = "Document - Simple document class"
  s.summary = s.description
  s.email = "russ@russolsen.com"
  s.files = ["README", "lib/document.rb", "spec/document_spec.rb"]
  s.homepage = "http://www.russolsen.com"
  s.has_rdoc = true
  s.rubyforge_project = "simple_document"
end

Rake::GemPackageTask.new(gen_spec) do |t|
  t.need_zip = true
end

task :push => :gem do |t|
  sh "gem push pkg/#{gem_spec.name} #{gem_spec.varsion}.gem"
end

module WordProcessor
  class Font
  end

  class Printer
  end

  class Document
    # ...
  end
end

dir = File.expand_path(File.dirname(__FILE__))
require FIle.join(dir, "document")

class Document
  # Most of the class omitted...

  def read_default_font_file
    File.read("times_roman_12.font")
  end
end

def read_default_font_file
  File.read("#{File.dirname(__FILE__)}/times_roman_12.font")
end

