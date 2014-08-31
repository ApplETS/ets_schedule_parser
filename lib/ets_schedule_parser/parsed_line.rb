module EtsScheduleParser
  class ParsedLine
    attr_reader :course, :group, :period

    def initialize(line)
      @course = CourseParsedLine.new(line)
      @group = GroupParsedLine.new(line)
      @period = PeriodParsedLine.new(line)
    end

    def course?
      @course.valid?
    end

    def group?
      @group.valid?
    end

    def period?
      @period.valid?
    end
  end
end