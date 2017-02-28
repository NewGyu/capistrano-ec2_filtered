# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/ec2_filtered/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-ec2_filtered"
  spec.version       = Capistrano::Ec2Filtered::VERSION
  spec.authors       = ["NewGyu"]
  spec.email         = ["newgyu@kinoboku.net"]
  spec.summary       = %q{Get ip addresses of AWS EC2 instances filtered.}
  spec.description   = %q{Get ip addresses of AWS EC2 instances filtered.}
  spec.homepage      = "https://github.com/a2ikm/capistrano-ec2_tagged"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk"
  spec.add_dependency "capistrano", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
