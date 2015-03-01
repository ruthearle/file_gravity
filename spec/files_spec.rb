require 'spec_helper'
require 'files'

describe 'Files' do

  let(:files_list)  { [{"id"=>14913224,
                        "name"=>"music",
                        "extension"=>"mp3",
                        "version"=>1,
                        "size"=>16377897,
                        "created_at"=>"2015-02-26T09:57:42Z",
                        "updated_at"=>"2015-02-26T09:58:08Z",
                        "creator"=>{
                          "name"=>"Ruth Earle",
                          "email"=>"me@ruthearle.com",
                          "uuid"=>"71f72a76-1c9c-4961-ba3c-2c59a43142b1"
                        },
                        "url"=>"https://my.workshare.com/decks/14913224",
                        "access_token"=>"Q1_lGRAy0bx90M6v",
                        "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png",
                        "folder_id"=>1209741}]
                    }
  let(:files) { Files.new(files_list) }

  describe "#initialize" do
    it "will not raise an error when initialised" do
      expect{files}.not_to raise_error
    end
  end

  describe "#list" do
    it "lists files with their name and file extension" do
      #file = [{'name' => 'music', 'extension' => 'mp3', 'size' => '0.001003'}]
      expect(Files.new(files_list).list).to eq ["type" => "music.mp3", "size"=>"16377897"]
    end
  end

  describe "#total_weight" do
    it "calculates the basic weight of a file" do
      weight = 19.65
      expect(files.total_weight).to eq weight
    end
  end
end
