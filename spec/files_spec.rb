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
      file = [{'name' => 'music', 'type' => 'mp3', 'size' => '1003'}]
      expect(Files.new(file).files).to eq "music.mp3 0.001003"
    end
  end
end
