require 'spec_helper'

describe CodeLine do
    
  it 'should read the file and count the number of lines in the file' do
    codeline = CodeLine.new("./spec/fixture/testfile.java")
    codeline.count.should eq(5) 
  end

  it 'should count the number of lines excluding the blank line' do
    codeline = CodeLine.new("./spec/fixture/testfile_blank.java")
    codeline.count.should eq(5) 
  end

  it 'should count the number of lines excluding the single line comments' do
    codeline = CodeLine.new("./spec/fixture/testfile_singleline.java")
    codeline.count.should eq(5)
  end

  it 'should count the number of lines excluding the multiline comments' do
    codeline = CodeLine.new("./spec/fixture/testfile_multiline.java")
    codeline.count.should eq(5)
  end
end
