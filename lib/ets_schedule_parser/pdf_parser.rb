module EtsScheduleParser
  class PdfParser
    class << self
      def execute(path, &block)
        stream = EtsScheduleParser::PdfStream.from_file(path)
        parsed_lines = extract_parsed_lines_from(stream, &block)
        stream.close

        parsed_lines
      end

      private

      def extract_parsed_lines_from(stream)
        stream.collect do |line|
          parsed_line = EtsScheduleParser::ParsedLine.new(line)
          yield parsed_line if block_given?
          parsed_line
        end
      end
    end
  end
end
