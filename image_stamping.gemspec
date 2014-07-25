# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_stamping/version'

Gem::Specification.new do |spec|
  spec.name          = "image_stamping"
  spec.version       = ImageStamping::VERSION
  spec.authors       = ["Jone Samra"]
  spec.email         = ["jonemob@gmail.com"]
  spec.summary       = %q{An easy way to add text to an image using ImageMagic & the RMagick gem.}
  spec.description   = %q{An easy way to add text to an image using ImageMagic & the RMagick gem.}
  spec.homepage      = "https://github.com/phenomen2277/image_stamping"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rmagick", "~> 2.13.2"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
