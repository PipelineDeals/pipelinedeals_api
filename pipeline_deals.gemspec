# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/pipeline_deals/version'

Gem::Specification.new do |gem|
  gem.name          = "pipeline_deals"
  gem.version       = PipelineDeals::VERSION
  gem.authors       = ["Grant Ammons"]
  gem.email         = ["gammons@gmail.com"]
  gem.description   = %q{The pipeline_deals gem is a nice ruby wrapper around the PipelineDeals API.}
  gem.summary   = %q{The pipeline_deals gem is a nice ruby wrapper around the PipelineDeals API.}
  gem.homepage      = "https://github.com/PipelineDeals/pipelinedeals_api"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('activeresource', '~> 4.0.0')
end
