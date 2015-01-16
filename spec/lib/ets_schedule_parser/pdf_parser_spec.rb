require 'spec_helper'

describe EtsScheduleParser::PdfParser do
  describe 'execute' do
    let(:stream) { ['first line', 'second line'] }
    let(:first_parsed_line) { double(EtsScheduleParser::ParsedLine) }
    let(:second_parsed_line) { double(EtsScheduleParser::ParsedLine) }
    let(:parsed_lines) { [first_parsed_line, second_parsed_line] }

    before(:each) do
      allow(EtsScheduleParser::PdfStream).to receive(:from_file).with('a_pdf_path').and_return stream

      allow(EtsScheduleParser::ParsedLine).to receive(:new).with('first line').and_return first_parsed_line
      allow(EtsScheduleParser::ParsedLine).to receive(:new).with('second line').and_return second_parsed_line

      expect(stream).to receive(:close)
    end

    context 'when using it without a block' do
      it 'returns an array of parsed lines' do
        expect(EtsScheduleParser::PdfParser.execute('a_pdf_path')).to eq(parsed_lines)
      end
    end

    context 'when passing with a block' do
      it 'yields a parsed line for every line in the pdf' do
        expect{ |b|
          EtsScheduleParser::PdfParser.execute('a_pdf_path', &b)
        }.to yield_successive_args(*parsed_lines)
      end
    end
  end
end
