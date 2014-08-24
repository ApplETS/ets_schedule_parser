require 'spec_helper'

describe EtsScheduleParser::PdfStream do
  context "when specifying a pdf file path" do
    let(:input) { pdf_fixture_path("2013_automne_log") }
    let(:stream) { EtsScheduleParser::PdfStream.from_file(input) }
    let(:stream_output) { text_fixture("2013_automne_log") }

    it "should be an IO stream" do
      expect(stream).to be_a(IO)
    end

    it "should read the PDF as a stream" do
      expect(stream.read).to eq(stream_output)
    end
  end
end