# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prospector/version'

Gem::Specification.new do |spec|
  spec.name          = "prospector"
  spec.version       = BillboardTopSongs::VERSION
  spec.authors       = ["Sean Clarke"]

  spec.summary       = %q{This Ruby Gem provides a CLI to view the top 100 songs in music as per the Billboard charts.}
  spec.homepage      = "https://github.com/SCDesigns/prospector"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'nokogiri'
end
