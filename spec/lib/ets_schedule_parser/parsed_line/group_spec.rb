require 'spec_helper'

describe EtsScheduleParser::ParsedLine::Group do
  include_examples "invalid lines for parser"

  {
      "             02    Lun       18:00 - 21:30   C           A-3336               M. Brouillette" => ["02", "Lun", "18:00", "21:30", "C"],
      "             01    Jeu       13:30 - 17:00   TP          A-1350               L.Trudeau" => ["01", "Jeu", "13:30", "17:00", "TP"],
      "             15    Mar       09:00 - 12:30   TP A+B      B-0908               P. Choquette" => ["15", "Mar", "09:00", "12:30", "TP A+B"],
      "             01    Ven       08:45 - 12:15   TP-Labo A   B-3402               C. Talhi" => ["01", "Ven", "08:45", "12:15", "TP-Labo A"],
      "             01    Mer       18:00 - 20:00   TP/Labo     A-3322               F. Robert" => ["01", "Mer", "18:00", "20:00", "TP/Labo"]
  }.each do |line, attributes|
    context "when the line '#{line}' is passed" do
      subject { EtsScheduleParser::ParsedLine::Group.new(line) }

      it "should be valid" do
        expect(subject).to be_valid
      end

      specify { expect(subject.nb).to eq(attributes[0]) }
      specify { expect(subject.weekday).to eq(attributes[1]) }
      specify { expect(subject.start_time).to eq(attributes[2]) }
      specify { expect(subject.end_time).to eq(attributes[3]) }
      specify { expect(subject.type).to eq(attributes[4]) }
    end
  end
end