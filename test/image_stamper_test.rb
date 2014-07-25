require "test_helper"

class ImageStamperTest < Test::Unit::TestCase

  def test_throw_exception_if_input_file_is_not_given
    i = create_image_stamper
    assert_raise RuntimeError do
      i.stamp("JohnnyBoy")
    end
  end

  def test_add_text_stamp_in_north_west
    i = create_image_stamper
    i.gravity :northwest
    i.font_size = 32
    i.font_color = "yellow"
    i.font_italic = true
    i.font_bold = true
    i.input_file = current_dir +  "/1.jpg"
    i.output_file = current_dir + "/north_west_stamp.jpg"

    assert i.stamp("Baghdad!")
  end

  def test_add_text_stamp_in_north_east
    i = create_image_stamper
    i.gravity :northeast
    i.font_size = 32
    i.font_color = "yellow"

    i.input_file = current_dir +  "/1.jpg"
    i.output_file = current_dir + "/north_east_stamp.jpg"

    assert i.stamp("Baghdad!")
  end

  def test_add_text_stamp_in_south_west
    i = create_image_stamper
    i.gravity :southwest
    i.font_size = 32
    i.font_color = "yellow"

    i.input_file = current_dir +  "/1.jpg"
    i.output_file = current_dir + "/south_west_stamp.jpg"

    assert i.stamp("Baghdad!")
  end

  def test_add_text_stamp_in_south_east
    i = create_image_stamper
    i.gravity :southeast
    i.font_size = 32
    i.font_color = "yellow"

    i.input_file = current_dir +  "/1.jpg"
    i.output_file = current_dir + "/south_east_stamp.jpg"

    assert i.stamp("Baghdad!")
  end


  private
  def create_image_stamper
    i = ImageStamping::ImageStamper.new
  end

  def current_dir
    File.expand_path File.dirname(__FILE__)
  end
end