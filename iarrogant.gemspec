# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iarrogant/version'

Gem::Specification.new do |spec|
  spec.name          = "iarrogant"
  spec.version       = Iarrogant::VERSION
  spec.authors       = ["seo"]
  spec.email         = ["seotownsend@icloud.com"]
  spec.summary       = %q{A command line tool that converts a XML style plist .entitlements file into the proper XML style plist .xcent}
  spec.description   = %q{iArrogant is a command line tool that converts a XML style plist .entitlements file into the proper XML style plist .xcent used by codesign; purpose built for our testing CI system @Fittr.}
  spec.homepage      = "https://github.com/sotownsend/iarrogant"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_runtime_dependency "plist thor", "~> 0"
  spec.executables << 'iarrogant'
end
