module EtsScheduleParser
  class PdfParser
    def self.parse(path, ignored_course_names = [])
      stream = EtsScheduleParser::PdfStream.from_file(path)
      hash = EtsScheduleParser::StreamParser.parse(stream, ignored_course_names)
      EtsScheduleParser::RecursiveStruct.build(hash)
    end
  end
end