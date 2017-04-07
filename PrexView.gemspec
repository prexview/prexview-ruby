# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PrexView/version'

Gem::Specification.new do |spec|
  spec.name          = "PrexView"
  spec.version       = PrexView::VERSION
  spec.authors       = ["Urielable", "prexview"]
  spec.email         = ["uriel85@gmail.com"]

  spec.summary       = "A composer library to use PrexView a fast, scalable and very friendly service for programatic HTML, PDF, PNG or JPG generation using JSON or XML data."
  spec.description   = "A composer library to use PrexView a fast, scalable and very friendly service for programatic HTML, PDF, PNG or JPG generation using JSON or XML data."
  spec.homepage      = "https://github.com/prexview/prexview-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end