RSpec.shared_examples "invalid lines for parser" do
  [
      "ÉCOLE DE TECHNOLOGIE SUPÉRIEURE",
      "                                             HORAIRE AUTOMNE 2013",
      "COURS        GR    JOUR        HEURE         ACTIVITÉ    LOCAL                ENSEIGNANT                                  PRÉALABLES",
      "         Date : 2013-09-19    "
  ].each do |invalid_line|
    context "when the line '#{invalid_line}' is passed" do
      subject { described_class.new(invalid_line) }

      it "should be invalid" do
        expect(subject).to_not be_valid
      end
    end
  end
end