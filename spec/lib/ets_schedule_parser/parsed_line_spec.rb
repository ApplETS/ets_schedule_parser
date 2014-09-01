require 'spec_helper'

describe EtsScheduleParser::ParsedLine do
  subject { EtsScheduleParser::ParsedLine.new('a line') }
  let(:course) { double(EtsScheduleParser::ParsedLine::Course) }
  let(:group) { double(EtsScheduleParser::ParsedLine::Group) }
  let(:period) { double(EtsScheduleParser::ParsedLine::Period) }

  before(:each) do
    allow(EtsScheduleParser::ParsedLine::Course).to receive(:new).with('a line').and_return course
    allow(EtsScheduleParser::ParsedLine::Group).to receive(:new).with('a line').and_return group
    allow(EtsScheduleParser::ParsedLine::Period).to receive(:new).with('a line').and_return period
  end

  specify { expect(subject.course).to eq(course) }
  specify { expect(subject.group).to eq(group) }
  specify { expect(subject.period).to eq(period) }

  [false, true].each do |validity|
    context "when the course validity is #{validity}" do
      before(:each) { allow(course).to receive(:valid?).and_return validity }

      specify { expect(subject.course?).to eq(validity) }
    end
  end

  [false, true].each do |validity|
    context "when the group validity is #{validity}" do
      before(:each) { allow(group).to receive(:valid?).and_return validity }

      specify { expect(subject.group?).to eq(validity) }
    end
  end

  [false, true].each do |validity|
    context "when the period validity is #{validity}" do
      before(:each) { allow(period).to receive(:valid?).and_return validity }

      specify { expect(subject.period?).to eq(validity) }
    end
  end
end