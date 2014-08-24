module EtsScheduleParser
  class ParsedLine
    COURSE = /^\f?((?:\w{3,4}EST)|(?:\w{3}\d{3}))/i
    GROUP = /^\f?\s*(\d{1,2})\s*(\w{3})\s*(\d{2}:\d{2})\s-\s(\d{2}:\d{2})\s*(([\d\w\/\-\\+]+\s?)+)/i
    PERIOD = /^\f?\s*(\w{3})\s*(\d{2}:\d{2})\s-\s(\d{2}:\d{2})\s*(([\d\w\/\-\\+]+\s?)+)/i

    def initialize(line)
      @line = line
    end

    def course?
      !!course_match_data
    end

    def group?
      !!group_match_data
    end

    def period?
      !!period_match_data
    end

    def course_name
      course_match_data[1]
    end

    def group_nb
      group_match_data[1].to_i
    end

    def group_attributes
      group_match_data[2..5].collect { |v| v.strip }
    end

    def period_attributes
      period_match_data[1..4].collect { |v| v.strip }
    end

    def course_named?(name)
      course_match_data[0] == name
    end

    private

    def course_match_data
      COURSE.match(@line)
    end

    def group_match_data
      GROUP.match(@line)
    end

    def period_match_data
      PERIOD.match(@line)
    end
  end
end