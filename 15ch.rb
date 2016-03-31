module Rendering
  class Font
    attr_accessor :name, :weight, :size
  
    def initialize(name, weight = :normal, size = 10)
      @name = name
      @weight = weight
      @size = size
    end

    # Rest of the class omitted...
  end

  class PaperSize
    attr_accessor :name, :width, :height

    def initialize(name = "US Let", width = 8.5, height = 11.0)
      @name = name
      @width = width
      @height = height
    end
    # Rest of the class omitted...
  end
end

module Rendering
  # Font and PaperSize classes omitted...

  DEFAULT_FONT = Font.new("dafault")
  DEFAULT_PAPER_SIZE = PaperSize.new
end

module WordProcessor
  module Rendering
    class Font
      # Guts of class omitted...
    end

    # and so on
  end
end

module WordProcessor

  def self.points_to_inches(points)
    points / 72.0
  end

  def self.inches_to_points(inches)
    inches * 72.0
  end

  # Rest of the module omitted
end

module Rendering
  class Font
    # bunk of class omitted...
  end

  DEFAULT_FONT = Font.new("default")
end

module Rendering
  class PaperSize
    # Bunk of class omitted...
  end

  DEFAULT_PAPER_SIZE = PaperSize.new
end

require "font"
require "paper_size"

the_module = Rendering

times_new_roman_font = the_module::Font.new("times-new-roman")

module TonsOTOner
  class PrintQueue
    def submit(print_job)
      # Send the job off for printing to this laser printer...
    end

    def cancel(print_job)
      # Stop the print job on this laser printer...
    end
  end

  class Administration
    def power_off
      # Turn this laser printer off...
    end

    def start_self_test
      # test this laser printer...
    end
  end
end

module OceansOfInk
  class PrintQueue
    def submit(print_job)
      # Send the job off for printing to this ink jet printer...
    end

    def cancel(print_job)
      # Stop the print job on this ink jet printer...
    end
  end

  class Administration
    def power_off
      # Turn this ink jet printer off...
    end
 
    def start_self_test
      # Test this ink jet printer...
    end
  end
end

if use_laser_printer
  print_module = TonsOToner
else
  print_module = OceansOfInk
end

admin = print_module::Administration.new

module WordProcessor
  
  def self.points_to_inches(points)
    points / 72.0
  end

end

module Subsystem
  module Output
    module Rendering
      module GlyphSet
        class Font
          # ...

Subsystem::Output::Renderring::GlyhSet::Font
