module EtsScheduleParser
  class ParsedLine
    class BaseParsedLine
      def initialize(line)
        @match_data = match_pattern.match(line)
      end

      def valid?
        !!@match_data
      end
    end
  end
end