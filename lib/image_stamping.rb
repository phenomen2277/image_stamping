require "RMagick"
require "image_stamping/version"

module ImageStamping
  class ImageStamper
    attr_accessor :input_file, :output_file, :font, :font_size, :font_color, :font_bold, :font_italic

    def initialize()
      @input_file = ''
      @output_file = ''

      @font = 'Arial'
      @font_size = 32
      @font_color = 'white'
      @font_bold = false
      @font_italic = false
      @gravity_value = Magick::SouthEastGravity
    end

    def stamp(text, width = 0, height = 0, x = 30, y = 30)
      raise RuntimeError, "The input file does not exist" if @input_file.empty? || !file_exists?(@input_file)
      raise RuntimeError, "The output file has not been given" if @output_file.empty?

      begin
        img = Magick::Image.read(@input_file).first
        drawing = Magick::Draw.new
        drawing.font = @font
        drawing.pointsize = @font_size
        drawing.font_weight = Magick::BoldWeight if @font_bold
        drawing.font_style = Magick::ItalicStyle if @font_italic
        drawing.fill = @font_color

        drawing.gravity = @gravity_value
        drawing.annotate(img, width, height, x, y, text)
        img.write(@output_file)
      rescue Exception => e
        raise RuntimeError, e.message
      end

      true
    end

    def gravity(value)
      case value
        when :northeast
          @gravity_value = Magick::NorthEastGravity
        when :northwest
          @gravity_value = Magick::NorthWestGravity
        when :southeast
          @gravity_value = Magick::SouthEastGravity
        when :southwest
          @gravity_value = Magick::SouthWestGravity
        else
          @gravity_value = Magick::SouthEastGravity
      end
    end

    private
    def file_exists?(file)
      return true if (File.file?(file))
      false
    end
  end
end
