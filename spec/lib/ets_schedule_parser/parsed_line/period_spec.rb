require 'spec_helper'

describe EtsScheduleParser::ParsedLine::Period do
  include_examples "invalid lines for parser"

  {
      "                   Lun       18:00 - 21:30   C           A-3336" => ["Lun", "18:00", "21:30", "C"],
      "                   Jeu       13:30 - 17:00   TP          A-1350" => ["Jeu", "13:30", "17:00", "TP"],
      "                   Mar       09:00 - 12:30   TP A+B      B-0908" => ["Mar", "09:00", "12:30", "TP A+B"],
      "                   Ven       08:45 - 12:15   TP-Labo A   B-3402" => ["Ven", "08:45", "12:15", "TP-Labo A"],
      "                   Mer       18:00 - 20:00   TP/Labo     A-3322" => ["Mer", "18:00", "20:00", "TP/Labo"]
  }.each do |line, attributes|
    context "when the line '#{line}' is passed" do
      subject { EtsScheduleParser::ParsedLine::Period.new(line) }

      it "should be valid" do
        expect(subject).to be_valid
      end

      specify { expect(subject.weekday).to eq(attributes[0]) }
      specify { expect(subject.start_time).to eq(attributes[1]) }
      specify { expect(subject.end_time).to eq(attributes[2]) }
      specify { expect(subject.type).to eq(attributes[3]) }
    end
  end
end