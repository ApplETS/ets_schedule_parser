require 'coveralls'
require 'ets_schedule_parser'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

Coveralls.wear!

def pdf_fixture_path(name)
  File.expand_path("../fixtures/pdfs/#{name}.pdf", __FILE__)
end

def text_fixture_path(name)
  File.expand_path("../fixtures/text/#{name}.txt", __FILE__)
end

def text_fixture(name)
  File.open(text_fixture_path(name), "r").read
end