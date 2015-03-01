require 'spec_helper'
require 'files'

describe 'Files' do

  describe "#initialize" do
    it "will not raise an error when initialised" do
      files_list = [{'id'=>'1'}]
      expect{Files.new(files_list)}.not_to raise_error
    end
  end

  describe "#list" do
    it "lists files with their name and file extension" do
      file = [{'name' => 'music', 'extension' => 'mp3', 'size' => '0.001003'}]
      expect(Files.new(file).list).to eq ["type" => "music.mp3", "size" => "0.001003"]

    end
  end
end
