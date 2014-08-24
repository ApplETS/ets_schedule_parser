module EtsScheduleParser
  class PdfStream
    def self.from_file(pdf_path)
      IO.popen("pdftotext -enc UTF-8 -layout #{pdf_path} \"-\"")
    end
  end
end