module EtsScheduleParser
  class StreamParser
    class << self
      def parse(stream, ignored_course_names = [])
        courses = []
        course = nil
        group = nil

        stream.each do |line|
          parsed_line = EtsScheduleParser::ParsedLine.new(line)

          if parsed_line.course? && (course.nil? || !parsed_line.course_named?(course[:name]))
            course = {name: parsed_line.course_name, groups: []}
            next if ignore?(parsed_line.course_name, ignored_course_names)

            courses << course
          elsif !course.nil? && parsed_line.group?
            group = {nb: parsed_line.group_nb, periods: [build_period(parsed_line.group_attributes)]}
            course[:groups] << group
          elsif !group.nil? && parsed_line.period?
            group[:periods] << build_period(parsed_line.period_attributes)
          end
        end

        stream.close
        courses
      end

      private

      def build_period(attributes)
        {
            weekday: attributes[0],
            start_time: attributes[1],
            end_time: attributes[2],
            type: attributes[3]
        }
      end

      def ignore?(course_name, ignored_course_names)
        ignored_course_names.any? do |ignored_course_name|
          ignored_course_name.downcase == course_name.downcase
        end
      end
    end
  end
end
