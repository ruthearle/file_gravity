require 'spec_helper'
require 'files'

describe 'Files' do

  describe "#initialize" do
    it "will not raise an error when initialised" do
      files_list = [{'id'=>'1'}]
      expect{Files.new(files_list)}.not_to raise_error
    end
  end

  describe "#files" do
    it "lists files with their name and file extension" do
      file = "music.mp3"
      size = "1mb"
      expect(Files.new(file).files).to eq "#{file}.#{size}"
    end
  end
end
