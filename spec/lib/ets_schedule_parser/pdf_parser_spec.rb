require 'spec_helper'

describe EtsScheduleParser::PdfParser do
  context 'when parsing a schedule pdf' do
    let(:stream) { double('IO stream') }
    let(:first_parsed_line) { double(EtsScheduleParser::ParsedLine) }
    let(:second_parsed_line) { double(EtsScheduleParser::ParsedLine) }

    before(:each) do
      allow(EtsScheduleParser::PdfStream).to receive(:from_file).with('a_pdf_path').and_return stream

      allow(stream).to receive(:each).and_yield('first line').and_yield('second line')
      allow(EtsScheduleParser::ParsedLine).to receive(:new).with('first line').and_return first_parsed_line
      allow(EtsScheduleParser::ParsedLine).to receive(:new).with('second line').and_return second_parsed_line
    end

    it 'should yield a parsed line for every line in the pdf and then close the stream' do
      expect(stream).to receive(:close)

      expect{ |b|
        EtsScheduleParser::PdfParser.parse('a_pdf_path', &b)
      }.to yield_successive_args(first_parsed_line, second_parsed_line)
    end
  end
end