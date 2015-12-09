# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gutentag/multitenancy/version'

Gem::Specification.new do |spec|
  spec.name          = "gutentag-multitenancy"
  spec.version       = Gutentag::Multitenancy::VERSION
  spec.authors       = ["Andy Stewart"]
  spec.email         = ["boss@airbladesoftware.com"]

  spec.summary       = %q{Extends Gutentag with support for multitenancy.}
  spec.description   = %q{Extends Gutentag with support for multitenancy.}
  spec.homepage      = "https://github.com/airblade/gutentag-multitenancy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  # NOTE: requires gutentag @ 51bd8f2 or later (not yet released).
  spec.add_dependency 'gutentag', '>= 0.7.0'
end
