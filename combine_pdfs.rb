#!/usr/bin/env ruby

require 'time'
require 'combine_pdf'

pdf = CombinePDF.new
pdfs = Dir['pdfs/*.pdf'].to_a.sort
pp pdfs
pdfs.each do |file|
  pdf << CombinePDF.load(file)
end
pdf.save "Janet_Jeffus_resume_#{Time.now.strftime("%Y-%m-%d")}.pdf"

