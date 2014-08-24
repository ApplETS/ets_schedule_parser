require 'spec_helper'

describe EtsScheduleParser::StreamParser do
  context "when parsing the header only" do
    let(:input) { stream_text_fixture("header_only") }

    it "should be empty" do
      expect(EtsScheduleParser::StreamParser.parse(input)).to be_empty
    end
  end

  context "when dealing with a course with a name ending in 'EST'" do
    let(:input) { stream_text_fixture("course_ending_with_EST") }
    let(:matest) { FactoryGirl.build(:matest) }

    it "should parse only the course" do
      expect(EtsScheduleParser::StreamParser.parse(input)).to match_array([matest])
    end
  end

  context "when dealing with a course with the file header" do
    let(:input) { stream_text_fixture("course_with_header") }
    let(:ang010) { FactoryGirl.build(:ang010) }

    it "should parse only one course" do
      expect(EtsScheduleParser::StreamParser.parse(input)).to match_array([ang010])
    end
  end

  context "when dealing with a course on multiple pages" do
    let(:input) { stream_text_fixture("course_on_multiple_pages") }
    let(:tin501) { FactoryGirl.build(:tin501) }

    it "should parse only one course" do
      expect(EtsScheduleParser::StreamParser.parse(input)).to match_array([tin501])
    end
  end

  context "when dealing with a empty courses" do
    let(:input) { stream_text_fixture("empty_courses") }
    let(:log750) { FactoryGirl.build(:log750) }
    let(:log791) { FactoryGirl.build(:empty_course, name: "LOG791") }
    let(:log792) { FactoryGirl.build(:empty_course, name: "LOG792") }

    it "should return empty courses" do
      expect(EtsScheduleParser::StreamParser.parse(input)).to match_array([log750, log791, log792])
    end
  end

  context "when dealing with a ingored course" do
    let(:input) { stream_text_fixture("ignored_courses") }
    let(:phy335) { FactoryGirl.build(:phy335) }

    it "should return empty courses" do
      expect(EtsScheduleParser::StreamParser.parse(input, %w(PRE010))).to match_array([phy335])
    end
  end
end