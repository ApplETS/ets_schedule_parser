require 'spec_helper'

describe EtsScheduleParser::ParsedLine::Course do
  include_examples "invalid lines for parser"

  {
      "ANG010" => "ANG010       ANGLAIS POUR INGÉNIEURS I",
      "COM110" => "COM110       MÉTHODES DE COMMUNICATION",
      "MATEST" => "MATEST       PROJET DE FIN D'ÉTUDES EN GÉNIE LOGICIEL                                                     PCL310",
      "PHYTEST" => "PHYTEST      ÉLECTRICITÉ ET MAGNÉTISME                                                                    ING150"
  }.each do |course_name, line|
    context "when the line '#{line}' is passed" do
      subject { EtsScheduleParser::ParsedLine::Course.new(line) }

      it "should be valid" do
        expect(subject).to be_valid
      end

      specify { expect(subject.name).to eq(course_name) }

      context "when comparing to another course name" do
        specify { expect(subject.named?("potato")).to eq(false) }
      end

      context "when comparing to the same course name" do
        specify { expect(subject.named?(course_name)).to eq(true) }
      end
    end
  end
end