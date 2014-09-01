require 'spec_helper'

class SampleParsedLine < EtsScheduleParser::ParsedLine::Base
  private

  def match_pattern
    %r(^valid line)
  end
end

describe EtsScheduleParser::ParsedLine::Base do
  context 'when defining a sample parsed line with a match pattern of %r(^valid line)' do
    context "when passing in a line 'invalid line'" do
      subject { SampleParsedLine.new('invalid line') }

      specify { expect(subject).to_not be_valid }
    end

    context "when passing in a line 'valid line'" do
      subject { SampleParsedLine.new('valid line') }

      specify { expect(subject).to be_valid }
    end
  end
end