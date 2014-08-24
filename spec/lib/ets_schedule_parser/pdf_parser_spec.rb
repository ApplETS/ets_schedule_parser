require 'spec_helper'

describe EtsScheduleParser::PdfParser do
  context 'when parsing a pdf from a path' do
    let(:stream) { double('pdf_stream') }
    let(:parsed_structs) { [double('struct')] }

    it "should convert to pdf to text then parse it" do
      allow(EtsScheduleParser::PdfStream).to receive(:from_file).with('a_pdf_path').and_return stream
      allow(EtsScheduleParser::StreamParser).to receive(:parse).with(stream, %w(SOME IGNORED COURSES)).and_return({parsed: :content})
      allow(EtsScheduleParser::RecursiveStruct).to receive(:build).with({parsed: :content}).and_return(parsed_structs)

      expect(EtsScheduleParser::PdfParser.parse('a_pdf_path', %w(SOME IGNORED COURSES))).to eq(parsed_structs)
    end
  end
end