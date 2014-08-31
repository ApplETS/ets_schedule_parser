module EtsScheduleParser
  class PdfParser
    def self.parse(path)
      stream = EtsScheduleParser::PdfStream.from_file(path)
      stream.each { |line| yield EtsScheduleParser::ParsedLine.new(line) }
      stream.close
    end
  end
end