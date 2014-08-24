require 'spec_helper'

describe EtsScheduleParser::RecursiveStruct do
  context "when passing in a simple hash" do
    let(:input) {{key: :value}}
    let(:output) { EtsScheduleParser::RecursiveStruct.build(input) }

    it "should return a hash wraped struct" do
      expect(output).to be_a(OpenStruct)

      expect(output.key).to eq(:value)
    end
  end

  context "when passing in a hash with an array of hashes as one of it's value" do
    let(:input) {{key: :value, collection: [{everything: :is_awesome}]}}
    let(:output) { EtsScheduleParser::RecursiveStruct.build(input) }

    it "should return a hash wraped struct" do
      expect(output).to be_a(OpenStruct)

      expect(output.key).to eq(:value)
      expect(output.collection.size).to eq(1)
      expect(output.collection[0].everything).to eq(:is_awesome)
    end
  end
end