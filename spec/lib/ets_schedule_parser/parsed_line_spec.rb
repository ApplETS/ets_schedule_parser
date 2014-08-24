# encoding: utf-8

require 'spec_helper'

describe EtsScheduleParser::ParsedLine do
  context "when a line that cannot be parsed is passed" do
    [
      "ÉCOLE DE TECHNOLOGIE SUPÉRIEURE",
      "                                             HORAIRE AUTOMNE 2013",
      "COURS        GR    JOUR        HEURE         ACTIVITÉ    LOCAL                ENSEIGNANT                                  PRÉALABLES",
      "         Date : 2013-09-19    "
    ].each do |line|
      context "when the line '#{line}' is passed" do
        subject { EtsScheduleParser::ParsedLine.new(line) }

        it "should not be recognized as a course, group nor period" do
          expect(subject).to_not be_course
          expect(subject).to_not be_group
          expect(subject).to_not be_period
        end
      end
    end
  end

  context "when a line that is represented as a course is passed" do
    {
      "ANG010" => "ANG010       ANGLAIS POUR INGÉNIEURS I",
      "COM110" => "COM110       MÉTHODES DE COMMUNICATION",
      "MATEST" => "MATEST       PROJET DE FIN D'ÉTUDES EN GÉNIE LOGICIEL                                                     PCL310",
      "PHYTEST" => "PHYTEST      ÉLECTRICITÉ ET MAGNÉTISME                                                                    ING150"
    }.each do |course_name, line|
      context "when the line '#{line}' is passed" do
        subject { EtsScheduleParser::ParsedLine.new(line) }

        it "should be recognized as a course" do
          expect(subject).to be_course
        end

        specify { expect(subject.course_name).to eq(course_name) }

        context "when comparing to another course name" do
          specify { expect(subject.course_named?("potato")).to eq(false) }
        end

        context "when comparing to the same course name" do
          specify { expect(subject.course_named?(course_name)).to eq(true) }
        end
      end
    end
  end

  context "when a line that is represented as a group" do
    {
      "             02    Lun       18:00 - 21:30   C           A-3336               M. Brouillette" => {nb: 2, attributes: ["Lun", "18:00", "21:30", "C"]},
      "             01    Jeu       13:30 - 17:00   TP          A-1350               L.Trudeau" => {nb: 1, attributes: ["Jeu", "13:30", "17:00", "TP"]},
      "             15    Mar       09:00 - 12:30   TP A+B      B-0908               P. Choquette" => {nb: 15, attributes: ["Mar", "09:00", "12:30", "TP A+B"]},
      "             01    Ven       08:45 - 12:15   TP-Labo A   B-3402               C. Talhi" => {nb: 1, attributes: ["Ven", "08:45", "12:15", "TP-Labo A"]},
      "             01    Mer       18:00 - 20:00   TP/Labo     A-3322               F. Robert" => {nb: 1, attributes: ["Mer", "18:00", "20:00", "TP/Labo"]}
    }.each do |line, group|
      context "when the line '#{line}' is passed" do
        subject { EtsScheduleParser::ParsedLine.new(line) }

        it "should be recognized as a group" do
          expect(subject).to be_group
        end

        specify { expect(subject.group_nb).to eq(group[:nb]) }
        specify { expect(subject.group_attributes).to eq(group[:attributes]) }
      end
    end
  end

  context "when a line that is represented as a period" do
    {
        "                   Lun       18:00 - 21:30   C           A-3336" => ["Lun", "18:00", "21:30", "C"],
        "                   Jeu       13:30 - 17:00   TP          A-1350" => ["Jeu", "13:30", "17:00", "TP"],
        "                   Mar       09:00 - 12:30   TP A+B      B-0908" => ["Mar", "09:00", "12:30", "TP A+B"],
        "                   Ven       08:45 - 12:15   TP-Labo A   B-3402" => ["Ven", "08:45", "12:15", "TP-Labo A"],
        "                   Mer       18:00 - 20:00   TP/Labo     A-3322" => ["Mer", "18:00", "20:00", "TP/Labo"]
    }.each do |line, period_attributes|
      context "when the line '#{line}' is passed" do
        subject { EtsScheduleParser::ParsedLine.new(line) }

        it "should be recognized as a period" do
          expect(subject).to be_period
        end

        specify { expect(subject.period_attributes).to eq(period_attributes) }
      end
    end
  end
end