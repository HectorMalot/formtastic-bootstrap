# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "formtastic-bootstrap"
  gem.version       = "1.2.0"
  gem.authors       = ["Matthew Bellantoni"]
  gem.email         = ["mjbellantoni@yahoo.com"]
  gem.description   = "Formtastic form builder to generate Twitter Bootstrap-friendly markup."
  gem.summary       = "Formtastic form builder to generate Twitter Bootstrap-friendly markup."
  gem.homepage      = "http://github.com/mjbellantoni/formtastic-bootstrap"

  gem.add_dependency "formtastic", "~> 2.1.0"
  gem.add_dependency "rails", ">= 3.1.0"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
end
