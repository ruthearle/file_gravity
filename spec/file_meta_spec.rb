require 'spec_helper'
require './lib/file_meta'

describe 'FileMeta' do

  let(:list)  { [{
                  "id"=>14913224,
                  "name"=>"music",
                  "extension"=>"mp3",
                  "version"=>1,
                  "size"=>16377897,
                  "created_at"=>"2015-02-26T09:57:42Z",
                  "updated_at"=>"2015-02-26T09:58:08Z",
                  "creator"=>
                    {
                     "name"=>"Ruth Earle",
                     "email"=>"me@ruthearle.com",
                     "uuid"=>"71f72a76-1c9c-4961-ba3c-2c59a43142b1"
                    },
                  "url"=>"https://my.workshare.com/decks/14913224",
                  "access_token"=>"Q1_lGRAy0bx90M6v",
                  "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png",
                  "folder_id"=>1209741
                 },
                 {
                  "id"=>14913212,
                  "name"=>"text",
                  "extension"=>"txt",
                  "version"=>1,
                  "size"=>100000,
                  "created_at"=>"2015-02-26T09:57:26Z",
                  "updated_at"=>"2015-02-26T09:57:28Z",
                  "creator"=>
                    {
                     "name"=>"Ruth Earle",
                     "email"=>"me@ruthearle.com",
                     "uuid"=>"71f72a76-1c9c-4961-ba3c-2c59a43142b1"
                    },
                  "url"=>"https://my.workshare.com/decks/14913212",
                  "access_token"=>"jDHB9OiKpjCEX25Z",
                  "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png",
                  "folder_id"=>1168672}
                 ]}
  let(:song) { 'song' }

  let(:files) { FileMeta.new(list) }

  describe "#initialize" do
    it "will not raise an error when initialised" do
      expect{files}.not_to raise_error
    end
  end

  describe "#files" do
    it "lists all files" do
      expect(FileMeta.new(list).files).to eq list
    end
  end

  describe "#count" do
    it "calculates the number of files within a category" do
      category = 'song'
      expect(files.count(category)).to eq 1
    end
  end

  describe "#basic_weight" do
    describe "multiply" do
      it "calculates the basic weight for categories that are multiplied" do
        category = 'song'
        expect(files.basic_weight(category)).to eq 19.65
      end
    end
    describe "add" do
      it "calculates the basic weight for text category" do
        category = 'text'
        expect(files.basic_weight(category)).to eq 100.1
      end
    end
  end

  describe "#total_weight_basic" do
    it "calculates the basic weight of files in all categories" do
      expect(files.total_basic_weight).to eq 119.75
    end
  end

  describe "#gravity_displacement" do
    it "calculates the difference bewteen basic weight and ideal weight" do
      ideal_weight = 103.27
      expect(files.gravity_displacement).to eq ideal_weight
    end
  end

  describe "#all_categories" do
    it "a list of all category types" do
      expect(files.all_categories).to eq ["document", "song", "video", "text", "other"]
    end
  end
end
