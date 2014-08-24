require 'coveralls'
require 'factory_girl'
require 'ets_schedule_parser'

Coveralls.wear!
FactoryGirl.find_definitions

def pdf_fixture_path(name)
  File.expand_path("../fixtures/pdfs/#{name}.pdf", __FILE__)
end

def text_fixture_path(name)
  File.expand_path("../fixtures/text/#{name}.txt", __FILE__)
end

def ruby_fixture_path(name)
  File.expand_path("../fixtures/ruby/#{name}.rb", __FILE__)
end

def text_fixture(name)
  File.open(text_fixture_path(name), "r").read
end

def stream_text_fixture(name)
  StringIO.new(text_fixture(name))
end

def ruby_fixture(name)
  file = File.open(ruby_fixture_path(name), "r")
  eval(file.read)
end