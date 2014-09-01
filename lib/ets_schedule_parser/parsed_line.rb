module EtsScheduleParser
  class ParsedLine
    attr_reader :course, :group, :period

    def initialize(line)
      @course = Course.new(line)
      @group = Group.new(line)
      @period = Period.new(line)
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