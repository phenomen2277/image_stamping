# ImageStamping

An easy way to add text to an image using ImageMagic.

## Installation

To use the gem you have to have the ImageMagick Installed in your system. On OSX i had to...

    brew install imagemagick

When I worked on the code, I got An exception thrown telling me that the fonts were missing. So i had to download these from

[http://sourceforge.net/projects/gs-fonts/?source=dlp](http://sourceforge.net/projects/gs-fonts/?source=dlp)

and place them into

    /usr/local/share/ghostscript/fonts


Once the above is done, you can now install the gem...

    gem 'image_stamping'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_stamping

## Usage

```
require "image_stamping"`

#Create an instance
i = ImageStamping::ImageStamper.new

#We want to place the text in the north west corner
#The options here can be either :northwest, :northeast, :southwest and :southeast
i.gravity :northwest

#With the font size = 32
i.font_size = 32

#We want the color of the text to be yellow
i.font_color = "yellow"

#And font style would be italic
i.font_italic = true

#How about a bold font!?
i.font_bold = true

#The input file to work on would be...
i.input_file = "image.jpg"

#The new file with the text would be called...
i.output_file = "image_stamped.jpg"

#Stamp the image with the text given as the first parameter
#The second parameter would be the width of the rectangle within which the text is positioned (default = 0)
#The third parameter would be the height of the rectangle within which the text is positioned (default = 0)
#The forth parameter would be the x offset of the rectangle (default = 30)
#And the fifth would be the y offset of the rectangle (default = 30)

i.stamp("JohnnyBoy")
```
