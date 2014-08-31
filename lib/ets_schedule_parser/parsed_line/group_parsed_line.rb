module EtsScheduleParser
  class ParsedLine
    class GroupParsedLine < BaseParsedLine
      def match_pattern
        /^\f?\s*(\d{1,2})\s*(\w{3})\s*(\d{2}:\d{2})\s-\s(\d{2}:\d{2})\s*(([\d\w\/\-\\+]+\s?)+)/i
      end

      %w(nb weekday start_time end_time type).each_with_index do |attribute_name, index|
        define_method attribute_name do
          attributes[index]
        end
      end

      private

      def attributes
        @attributes ||= @match_data[1..5].collect { |v| v.strip }
      end
    end
  end
end