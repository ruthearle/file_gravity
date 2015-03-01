require 'spec_helper'
require 'files'

describe 'Files' do

  let(:files_list)  { [{'id'=>'1', 'name'=>'document', 'extension'=>'docx', 'size'=>'0.001003'}] }
  let(:files) { Files.new(files_list) }

  describe "#initialize" do
    it "will not raise an error when initialised" do
      expect{files}.not_to raise_error
    end
  end

  describe "#list" do
    it "lists files with their name and file extension" do
      #file = [{'name' => 'music', 'extension' => 'mp3', 'size' => '0.001003'}]
      expect(Files.new(files_list).list).to eq ["type" => "document.docx", "size" => "0.001003"]
    end
  end

  describe "#calculate_gravity" do
    it "calculates the basic weight of a file" do
      weight = 0.0014042
      expect(files.calculate_gravity).to eq weight
    end
  end
end
