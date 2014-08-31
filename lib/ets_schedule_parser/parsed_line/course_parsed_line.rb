module EtsScheduleParser
  class ParsedLine
    class CourseParsedLine < BaseParsedLine
      def match_pattern
        /^\f?((?:\w{3,4}EST)|(?:\w{3}\d{3}))/i
      end

      def name
        @match_data[1]
      end

      def named?(name)
        self.name == name
      end
    end
  end
end