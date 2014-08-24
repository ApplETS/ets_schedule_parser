lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ets_schedule_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "ets_schedule_parser"
  spec.version       = EtsScheduleParser::VERSION
  spec.authors       = ["Krystian Czesak"]
  spec.email         = ["krystianczesak@gmail.com"]
  spec.description   = %q{A simple tool to extract the courses structure from PDFs provided by ETS.}
  spec.summary       = %q{A simple tool to extract the courses structure from PDFs provided by ETS.}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]
end
